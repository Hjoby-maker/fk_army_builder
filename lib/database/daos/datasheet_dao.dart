import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_dao.g.dart';

@DriftAccessor(tables: [Tdatasheet])
class DatasheetDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetDaoMixin {
  DatasheetDao(super.db);

  // CRUD
  Future<List<TdatasheetData>> getAllDatasheets() => select(tdatasheet).get();

  Future<TdatasheetData?> getDatasheetById(int id) =>
      (select(tdatasheet)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertDatasheet(TdatasheetCompanion datasheet) =>
      into(tdatasheet).insert(datasheet);

  Future<void> insertAllDatasheets(List<TdatasheetCompanion> datasheetsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheet, datasheetsList);
      });

  Future<int> deleteDatasheet(int id) =>
      (delete(tdatasheet)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TdatasheetData>> searchDatasheets(String query) =>
      (select(tdatasheet)
            ..where((t) => t.name.like('%$query%'))
            ..orderBy([(t) => OrderingTerm(expression: t.name)]))
          .get();

  Future<List<TdatasheetData>> getDatasheetsByFaction(String factionId) =>
      (select(tdatasheet)..where((t) => t.factionId.equals(factionId))).get();

  // Конвертация в модели
  Future<List<models.Datasheet>> getAllDatasheetModels() async {
    final data = await getAllDatasheets();
    return data
        .map((d) => models.Datasheet(
              id: d.id,
              name: d.name,
              factionId: d.factionId,
              sourceId: d.sourceId,
              legend: d.legend,
              role: d.role,
              loadout: d.loadout,
              transport: d.transport,
              virtual: d.virtual,
              leaderHead: d.leaderHead,
              leaderFooter: d.leaderFooter,
              damagedW: d.damagedW,
              damagedDescription: d.damagedDescription,
              link: d.link,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheet() async {
    final rowCount =
        await customSelect('select count(*) as count_ from tdatasheet;').get();
    // row.data – Map<String, dynamic>
    for (final _row in rowCount) {
      print('Datasheet count: ${_row.data['count_']} ');
    }
  }
}
