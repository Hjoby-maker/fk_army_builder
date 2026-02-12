import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'source_dao.g.dart';

@DriftAccessor(tables: [Tsource])
class SourceDao extends DatabaseAccessor<AppDatabase> with _$SourceDaoMixin {
  SourceDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TsourceData>> getAllSources() => select(tsource).get();
  
  Future<TsourceData?> getSourceById(String id) =>
      (select(tsource)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertSource(TsourceCompanion source) =>
      into(tsource).insert(source);
  
  Future<void> insertAllSources(List<TsourceCompanion> sourcesList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tsource, sourcesList);
      });
  
  Future<int> deleteSource(String id) =>
      (delete(tsource)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TsourceData>> searchSources(String query) =>
      (select(tsource)
        ..where((t) => t.name.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.name)])
      ).get();

  // Конвертация в модели
  Future<List<models.Source>> getAllSourceModels() async {
    final data = await getAllSources();
    return data.map((s) => models.Source(
      id: s.id,
      name: s.name,
      shortName: s.shortName,
      releaseDate: s.releaseDate,
      type: s.type,
      link: s.link,
    )).toList();
  }

  Future<void> dropAndRecreateTable() async {
    await customStatement('DROP TABLE IF EXISTS tsource');
    await customStatement('''
      CREATE TABLE tsource (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        short_name TEXT,
        release_date TEXT,
        type TEXT,
        link TEXT
      )
    ''');
    print('Таблица tsource пересоздана');
  }
}