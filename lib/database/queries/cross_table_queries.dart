import 'package:drift/drift.dart';
import 'package:fk_army_builder/models/unit_composition.dart';
import '../database.dart';
import '../../models/index.dart' as models;
import 'package:fk_army_builder/utils/composition_parser.dart';

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
    bool showLegendary = false,
  }) async {
    // 1. Получаем datasheets фракции через DAO
    final datasheetsData =
        await db.datasheetDao.getDatasheetsByFaction(factionId);
    if (datasheetsData.isEmpty) return [];

    // Получаем информацию об источниках для определения легендарности
    final sourceIds = datasheetsData.map((d) => d.sourceId).toSet().toList();
    final sources =
        await (select(db.tsource)..where((t) => t.id.isIn(sourceIds))).get();

    // Создаем map sourceId -> является ли источник легендарным
    final Map<int, bool> isLegendarySource = {};
    for (var source in sources) {
      // Проверяем, содержит ли название источника "Legends" (регистронезависимо)
      final isLegendary = source.name.toLowerCase().contains('legends');
      isLegendarySource[source.id] = isLegendary;
    }

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
      // ⚠️ ИСПРАВЛЕНИЕ: используем уже созданный isLegendarySource
      final isLegendary = isLegendarySource[dsData.sourceId] ?? false;

      // Фильтруем легендарные юниты если showLegendary = false
      if (!showLegendary && isLegendary) {
        continue;
      }

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
        isLegendary: isLegendary, // ← теперь переменная определена
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
      ..orderBy([OrderingTerm(expression: db.tdatasheetkeyword.keyword)]);
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

  /// Получает информацию о составе юнита
  Future<UnitComposition?> getUnitComposition(int datasheetId) async {
    // Получаем composition записи
    final compositionQuery = select(db.tdatasheetunitcomposition)
      ..where((t) => t.datasheetId.equals(datasheetId))
      ..orderBy([(t) => OrderingTerm(expression: t.line)]);

    final compositionData = await compositionQuery.get();

    if (compositionData.isEmpty) return null;

    // Получаем costs для этого юнита
    final costsQuery = select(db.tdatasheetmodelcost)
      ..where((t) => t.datasheetId.equals(datasheetId));

    final costsData = await costsQuery.get();

    // Для отладки - выведем все costs
    print('📊 Costs for datasheet $datasheetId:');
    for (var cost in costsData) {
      print('  - line ${cost.line}: ${cost.description} = ${cost.cost} pts');
    }

    // Определяем максимальное количество моделей из costs
    int maxModels = 0;
    final Map<int, int> costByLine = {}; // для хранения стоимости по line

    for (final cost in costsData) {
      costByLine[cost.line] = cost.cost!;

      if (cost.description != null) {
        final count = CompositionParser.parseModelCount(cost.description!);
        if (count > maxModels) {
          maxModels = count;
        }
        print('  📏 Parsed model count: $count from "${cost.description}"');
      }
    }

    // Парсим компоненты
    final components = <UnitComponent>[];

    for (final comp in compositionData) {
      if (comp.description != null) {
        print(
            '\n📝 Parsing component: "${comp.description}" at line ${comp.line}');
        final parsed = CompositionParser.parseComponent(comp.description!);
        print(
            '  Parsed: name="${parsed.name}", min=${parsed.min}, max=${parsed.max}');

        // Ищем стоимость для этого компонента
        // Сначала пробуем найти по line из composition
        int costPerModel = costByLine[comp.line] ?? 0;

        // Если не нашли по line, пробуем найти по названию в описании cost
        if (costPerModel == 0) {
          for (final cost in costsData) {
            if (cost.description != null &&
                cost.description!
                    .toLowerCase()
                    .contains(parsed.name.toLowerCase())) {
              costPerModel = cost.cost ?? 0;
              print(
                  '  Found cost by name: ${cost.description} = $costPerModel pts');
              break;
            }
          }
        } else {
          print('  Found cost by line ${comp.line}: $costPerModel pts');
        }

        components.add(UnitComponent(
          name: parsed.name,
          minCount: parsed.min,
          maxCount: parsed.max,
          costPerModel: costPerModel,
        ));
      }
    }

    // Если не нашли maxModels из costs, используем сумму max из компонентов
    if (maxModels == 0) {
      maxModels = components.fold(0, (sum, comp) => sum + comp.maxCount);
    }

    // Минимальное количество моделей - сумма min из компонентов
    final minModels = components.fold(0, (sum, comp) => sum + comp.minCount);

    print('\n📊 Final composition:');
    print('  Min models: $minModels, Max models: $maxModels');
    for (var comp in components) {
      print(
          '  - ${comp.name}: ${comp.minCount}-${comp.maxCount} @ ${comp.costPerModel} pts');
    }

    return UnitComposition(
      datasheetId: datasheetId,
      components: components,
      minModels: minModels,
      maxModels: maxModels,
    );
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

// В класс CrossTableQueries добавьте эти методы для диагностики

  /// Проверяет, существует ли фракция
  Future<bool> checkFactionExists(String factionId) async {
    final query = select(db.tfaction)..where((t) => t.id.equals(factionId));
    final result = await query.get();
    return result.isNotEmpty;
  }

  /// Получает количество datasheet для фракции
  Future<int> getDatasheetCountForFaction(String factionId) async {
    final query = select(db.tdatasheet)
      ..where((t) => t.factionId.equals(factionId));
    final result = await query.get();
    return result.length;
  }

  /// Получает пример datasheet для диагностики
  Future<String> getSampleDatasheet(String factionId) async {
    final query = select(db.tdatasheet)
      ..where((t) => t.factionId.equals(factionId))
      ..limit(1);
    final result = await query.get();
    if (result.isEmpty) return 'Нет данных';
    final ds = result.first;
    return 'id: ${ds.id}, name: ${ds.name}, role: ${ds.role}';
  }

  /// Получает количество keywords для фракции
  Future<int> getKeywordCountForFaction(String factionId) async {
    final query = select(db.tdatasheetkeyword).join([
      innerJoin(
        db.tdatasheet,
        db.tdatasheet.id.equalsExp(db.tdatasheetkeyword.datasheetId),
      ),
    ])
      ..where(db.tdatasheet.factionId.equals(factionId));

    final result = await query.get();
    return result.length;
  }

  /// Получает количество costs для фракции
  Future<int> getCostCountForFaction(String factionId) async {
    final query = select(db.tdatasheetmodelcost).join([
      innerJoin(
        db.tdatasheet,
        db.tdatasheet.id.equalsExp(db.tdatasheetmodelcost.datasheetId),
      ),
    ])
      ..where(db.tdatasheet.factionId.equals(factionId));

    final result = await query.get();
    return result.length;
  }

  /// Проверяет, есть ли у datasheet costs
  Future<bool> datasheetHasCosts(int datasheetId) async {
    final query = select(db.tdatasheetmodelcost)
      ..where((t) => t.datasheetId.equals(datasheetId));
    final result = await query.get();
    return result.isNotEmpty;
  }

// Добавьте в класс CrossTableQueries в файле cross_table_queries.dart

  /// Получает детачменты для указанной фракции
  Future<List<models.Detachment>> getDetachmentsByFaction(
      String factionId) async {
    final query = select(db.tdetachment)
      ..where((t) => t.factionId.equals(factionId))
      ..where(
          (t) => t.type.isNull() | t.type.equals('')) // NULL или пустая строка
      ..orderBy([(t) => OrderingTerm(expression: t.name)]);

    final data = await query.get();

    return data
        .map((d) => models.Detachment(
              id: d.id,
              factionId: d.factionId,
              name: d.name,
              legend: d.legend,
              type: d.type,
            ))
        .toList();
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
  final bool isLegendary;

  UnitSummary({
    required this.datasheet,
    required this.keywords,
    required this.costs,
    this.minCost,
    this.maxCost,
    this.isLegendary = false,
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
    if (minCost == maxCost) return '$minCost pts';
    return '$minCost–$maxCost pts';
  }

  /// Есть ли у юнита стоимость
  bool get hasCost => minCost != null || maxCost != null;

  String get legendaryStatus => isLegendary ? ' (Legends)' : '';
}
