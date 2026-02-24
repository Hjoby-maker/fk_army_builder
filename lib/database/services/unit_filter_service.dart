import '../database.dart';
import '../daos/datasheet_dao.dart';
import '../daos/datasheet_keyword_dao.dart';
import 'package:fk_army_builder/models/index.dart'; // Datasheet, DatasheetKeyword

class UnitFilterService {
  final AppDatabase _db;
  late final DatasheetDao _datasheetDao;
  late final DatasheetKeywordDao _keywordDao;

  UnitFilterService(this._db) {
    _datasheetDao = _db.datasheetDao;
    _keywordDao = _db.datasheetKeywordDao;
  }

  /// Возвращает юниты фракции с ключевыми словами
  Future<Map<Datasheet, List<DatasheetKeyword>>> getUnitsWithKeywords({
    required String factionId,
    List<String>? filterKeywords,
  }) async {
    // 1. Получаем datasheets через DAO
    final datasheetsData =
        await _datasheetDao.getDatasheetsByFaction(factionId);
    if (datasheetsData.isEmpty) return {};

    // 2. Конвертируем DataClass → Model
    final datasheets = datasheetsData
        .map((ds) => Datasheet(
              id: ds.id,
              name: ds.name,
              factionId: ds.factionId,
              sourceId: ds.sourceId,
              legend: ds.legend,
              role: ds.role,
              loadout: ds.loadout,
              transport: ds.transport,
              virtual: ds.virtual,
              leaderHead: ds.leaderHead,
              leaderFooter: ds.leaderFooter,
              damagedW: ds.damagedW,
              damagedDescription: ds.damagedDescription,
              link: ds.link,
            ))
        .toList();

    // 3. Получаем IDs для запроса keywords
    final ids = datasheetsData.map((d) => d.id).toList();

    // 4. Получаем keywords через DAO
    final keywordsData = await _keywordDao.getKeywordsByDatasheetIds(ids);

    // 5. Группируем keywords по datasheetId
    final keywordsByDsId = <int, List<DatasheetKeyword>>{};
    for (final kw in keywordsData) {
      keywordsByDsId.putIfAbsent(kw.datasheetId, () => []).add(kw);
    }

    // 6. Формируем результат с фильтрацией
    final result = <Datasheet, List<DatasheetKeyword>>{};

    for (final ds in datasheets) {
      final keywords = keywordsByDsId[ds.id] ?? [];

      if (filterKeywords != null && filterKeywords.isNotEmpty) {
        final hasMatch = keywords.any(
          (k) => k.keyword != null && filterKeywords.contains(k.keyword),
        );
        if (!hasMatch) continue;
      }

      result[ds] = keywords;
    }

    return result;
  }

  /// Уникальные ключевые слова фракции — через DAO
  /*Future<List<String>> getUniqueKeywordsByFaction(String factionId) async {
    final keywords = await _keywordDao.getUniqueKeywordsByFaction(factionId);
    return keywords
        .map((k) => k.keyword!)
        .whereType<String>()
        .toSet()
        .toList();
  }*/
}
