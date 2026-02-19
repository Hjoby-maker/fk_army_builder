import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_keyword_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetkeyword])
class DatasheetKeywordDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetKeywordDaoMixin {
  DatasheetKeywordDao(super.db);

  // CRUD
  Future<List<TdatasheetkeywordData>> getAllKeywords() =>
      select(tdatasheetkeyword).get();

  Future<List<TdatasheetkeywordData>> getKeywordsByDatasheetId(
          int datasheetId) =>
      (select(tdatasheetkeyword)
            ..where((t) => t.datasheetId.equals(datasheetId)))
          .get();

  Future<void> insertAllKeywords(
          List<TdatasheetkeywordCompanion> keywordsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetkeyword, keywordsList);
      });

  Future<int> deleteKeywordsByDatasheet(int datasheetId) =>
      (delete(tdatasheetkeyword)
            ..where((t) => t.datasheetId.equals(datasheetId)))
          .go();

  // Поиск
  Future<List<TdatasheetkeywordData>> searchKeywords(String query) =>
      (select(tdatasheetkeyword)
            ..where((t) => t.keyword.like('%$query%'))
            ..orderBy([(t) => OrderingTerm(expression: t.keyword)]))
          .get();

  // Конвертация в модели
  Future<List<models.DatasheetKeyword>> getAllKeywordModels() async {
    final data = await getAllKeywords();
    return data
        .map((k) => models.DatasheetKeyword(
              datasheetId: k.datasheetId,
              keyword: k.keyword,
              model: k.model,
              isFactionKeyword: k.isFactionKeyword,
            ))
        .toList();
  }

  // Получить уникальные ключевые слова для фракции по её имени (с JOIN)
  Future<List<String>> getUniqueKeywordsByFactionName(
      String factionName) async {
    final query = '''
    SELECT DISTINCT k.keyword
    FROM tdatasheetkeyword k
    JOIN tdatasheet d ON k.datasheetId = d.id
    JOIN tfaction f ON d.factionId = f.id
    WHERE f.name = ? AND k.keyword IS NOT NULL AND k.keyword != '' and 
    (k.model = 'ALL MODELS' or k.model isnull)
    and k.isFactionKeyword = 0
    and d.name != k.keyword
    ORDER BY k.keyword
  ''';

    final result = await customSelect(
      query,
      variables: [Variable.withString(factionName)],
    ).get();

    return result.map((row) => row.data['keyword'] as String).toList();
  }

  Future<void> debugLenTdatasheetKeyword() async {
    final rowCount =
        await customSelect('select count(*) as count_ from tdatasheetkeyword;')
            .get();
    // row.data – Map<String, dynamic>
    for (final _row in rowCount) {
      print('TdatasheetKeyword count: ${_row.data['count_']} ');
    }
  }
}
