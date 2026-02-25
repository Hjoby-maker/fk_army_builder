import 'package:drift/drift.dart';
import '../database.dart';
import '../../models/index.dart' as models;

/// Класс для сложных кросс-табличных запросов
/// Наследует DatabaseAccessor для доступа к select() и таблицам через db.*
class CrossTableQueries extends DatabaseAccessor<AppDatabase> {
  CrossTableQueries(super.db);

  // ─────────────────────────────────────────────────────────
  /// 🔹 ЗАПРОС 1: Юниты фракции с keywords и costs
  /// Возвращает список с полной информацией для отображения
  // ─────────────────────────────────────────────────────────
  Future<List<UnitSummary>> getUnitsSummaryByFaction({
    required String factionId,
    List<String>? keywordFilter, // опциональная фильтрация по keywords
  }) async {
    // 1. Получаем datasheets фракции через DAO
    final datasheetsData =
        await db.datasheetDao.getDatasheetsByFaction(factionId);
    if (datasheetsData.isEmpty) return [];

    final datasheetIds = datasheetsData.map((d) => d.id).toList();

    // 2. Получаем keywords для всех юнитов одним запросом
    final keywordsData =
        await db.datasheetKeywordDao.getKeywordsByDatasheetIds(datasheetIds);

    // 3. Группируем keywords по datasheetId
    final keywordsByDsId = <int, List<models.DatasheetKeyword>>{};
    for (final kw in keywordsData) {
      final keywordModel = models.DatasheetKeyword(
        datasheetId: kw.datasheetId,
        keyword: kw.keyword,
        model: kw.model,
        isFactionKeyword: kw.isFactionKeyword,
      );
      keywordsByDsId
          .putIfAbsent(keywordModel.datasheetId, () => [])
          .add(keywordModel);
    }

    // 4. Получаем costs для всех юнитов
    final costsData = await _getCostsByDatasheetIds(datasheetIds);
    final costsByDsId = <int, List<models.DatasheetModelCost>>{};
    for (final cost in costsData) {
      final costModel = models.DatasheetModelCost(
        datasheetId: cost.datasheetId,
        line: cost.line,
        description: cost.description,
        cost: cost.cost,
      );
      costsByDsId.putIfAbsent(costModel.datasheetId, () => []).add(costModel);
    }

    // 5. Формируем результат
    final results = <UnitSummary>[];

    for (final dsData in datasheetsData) {
      final datasheet = _convertDatasheet(dsData);
      final keywords = keywordsByDsId[dsData.id] ?? [];
      final costs = costsByDsId[dsData.id] ?? [];

      // Применяем фильтр по keywords если указан
      if (keywordFilter != null && keywordFilter.isNotEmpty) {
        final hasMatch = keywords.any(
          (k) => k.keyword != null && keywordFilter.contains(k.keyword),
        );
        if (!hasMatch) continue;
      }

      // Вычисляем статистику по стоимости
      final validCosts = costs.map((c) => c.cost).whereType<int>().toList();
      final minCost = validCosts.isEmpty
          ? null
          : validCosts.reduce((a, b) => a < b ? a : b);
      final maxCost = validCosts.isEmpty
          ? null
          : validCosts.reduce((a, b) => a > b ? a : b);

      results.add(UnitSummary(
        datasheet: datasheet,
        keywords: keywords,
        costs: costs,
        minCost: minCost,
        maxCost: maxCost,
      ));
    }

    // Сортировка по имени
    results.sort((a, b) => a.datasheet.name.compareTo(b.datasheet.name));

    return results;
  }

  // ─────────────────────────────────────────────────────────
  /// 🔹 ЗАПРОС 2: Уникальные keywords фракции (для фильтра/чипсов)
  /// JOIN: tdatasheetkeyword + tdatasheet (factionId в tdatasheet)
  // ─────────────────────────────────────────────────────────
  Future<List<String>> getUniqueKeywordsByFaction(String factionId) async {
    // 🔥 JOIN через select().join() — factionId ищем в tdatasheet
    final query = select(db.tdatasheetkeyword).join([
      innerJoin(
        db.tdatasheet,
        db.tdatasheet.id.equalsExp(db.tdatasheetkeyword.datasheetId),
      ),
    ])
      ..where(db.tdatasheet.factionId.equals(factionId))
      ..where(db.tdatasheetkeyword.keyword.isNotNull())
      ..orderBy([OrderingTerm(expression: db.tdatasheetkeyword.keyword!)]);
    // ⚠️ distinct не работает с JOIN в Drift 2.x — используем .toSet() ниже

    final rows = await query.get();

    // 🔥 Убираем дубликаты на уровне Dart
    return rows
        .map((row) => row.readTable(db.tdatasheetkeyword).keyword!)
        .whereType<String>()
        .toSet()
        .toList();
  }

  // ─────────────────────────────────────────────────────────
  /// 🔹 ЗАПРОС 3: Keywords для конкретного юнита
  // ─────────────────────────────────────────────────────────
  Future<List<models.DatasheetKeyword>> getKeywordsForUnit(
      int datasheetId) async {
    final data =
        await db.datasheetKeywordDao.getKeywordsByDatasheetId(datasheetId);
    return data
        .map((k) => models.DatasheetKeyword(
              datasheetId: k.datasheetId,
              keyword: k.keyword,
              model: k.model,
              isFactionKeyword: k.isFactionKeyword,
            ))
        .toList();
  }

  // ─────────────────────────────────────────────────────────
  /// 🔹 ЗАПРОС 4: Costs для конкретного юнита
  // ─────────────────────────────────────────────────────────
  Future<List<models.DatasheetModelCost>> getCostsForUnit(
      int datasheetId) async {
    final query = select(db.tdatasheetmodelcost)
      ..where((t) => t.datasheetId.equals(datasheetId));

    final data = await query.get();
    return data
        .map((c) => models.DatasheetModelCost(
              datasheetId: c.datasheetId,
              line: c.line,
              description: c.description,
              cost: c.cost,
            ))
        .toList();
  }

  // ─────────────────────────────────────────────────────────
  /// 🔹 ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ─────────────────────────────────────────────────────────

  /// Получение costs для списка datasheet IDs
  Future<List<TdatasheetmodelcostData>> _getCostsByDatasheetIds(
    List<int> datasheetIds,
  ) async {
    if (datasheetIds.isEmpty) return [];
    return (select(db.tdatasheetmodelcost)
          ..where((t) => t.datasheetId.isIn(datasheetIds)))
        .get();
  }

  /// Конвертация TdatasheetData → models.Datasheet
  models.Datasheet _convertDatasheet(TdatasheetData data) {
    return models.Datasheet(
      id: data.id,
      name: data.name,
      factionId: data.factionId,
      sourceId: data.sourceId,
      legend: data.legend,
      role: data.role,
      loadout: data.loadout,
      transport: data.transport,
      virtual: data.virtual,
      leaderHead: data.leaderHead,
      leaderFooter: data.leaderFooter,
      damagedW: data.damagedW,
      damagedDescription: data.damagedDescription,
      link: data.link,
    );
  }
}

// ─────────────────────────────────────────────────────────
/// 📦 Модель-результат для удобного отображения юнита в UI
// ─────────────────────────────────────────────────────────
class UnitSummary {
  final models.Datasheet datasheet;
  final List<models.DatasheetKeyword> keywords;
  final List<models.DatasheetModelCost> costs;
  final int? minCost;
  final int? maxCost;

  UnitSummary({
    required this.datasheet,
    required this.keywords,
    required this.costs,
    this.minCost,
    this.maxCost,
  });

  /// Удобные геттеры для UI
  String get name => datasheet.name;
  String? get role => datasheet.role;
  String? get factionId => datasheet.factionId;

  /// Список keywords как строка для отображения
  String get keywordsString {
    if (keywords.isEmpty) return '—';
    return keywords
        .map((k) => k.keyword)
        .whereType<String>()
        .take(5)
        .join(', ');
  }

  /// Форматированная стоимость
  String get costString {
    if (minCost == null && maxCost == null) return '—';
    if (minCost == maxCost) return '${minCost} pts';
    return '${minCost}–${maxCost} pts';
  }

  /// Есть ли у юнита стоимость
  bool get hasCost => minCost != null || maxCost != null;
}
