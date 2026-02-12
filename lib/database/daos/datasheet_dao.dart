import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_dao.g.dart';

@DriftAccessor(tables: [Tdatasheet])
class DatasheetDao extends DatabaseAccessor<AppDatabase> with _$DatasheetDaoMixin {
  DatasheetDao(AppDatabase db) : super(db);

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
        ..orderBy([(t) => OrderingTerm(expression: t.name)])
      ).get();
  
  Future<List<TdatasheetData>> getDatasheetsByFaction(String factionId) =>
      (select(tdatasheet)..where((t) => t.factionId.equals(factionId))).get();

  // Конвертация в модели
  Future<List<models.Datasheet>> getAllDatasheetModels() async {
    final data = await getAllDatasheets();
    return data.map((d) => models.Datasheet(
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
    )).toList();
  }

  Future<void> dropAndRecreateTable() async {
    await customStatement('DROP TABLE IF EXISTS tdatasheet');
    await customStatement('''
      CREATE TABLE tdatasheet (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        faction_id TEXT NOT NULL,
        source_id TEXT NOT NULL,
        legend TEXT,
        role TEXT,
        loadout TEXT,
        transport TEXT,
        virtual BOOLEAN,
        leaderHead TEXT,
        leaderFooter TEXT,
        damagedW TEXT,
        damagedDescription TEXT,
        link TEXT,
      )
    ''');
    print('Таблица tdatasheet пересоздана');
  }
}