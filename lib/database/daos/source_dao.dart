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
  
  Future<TsourceData?> getSourceById(int id) =>
      (select(tsource)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertSource(TsourceCompanion source) =>
      into(tsource).insert(source);
  
  Future<void> insertAllSources(List<TsourceCompanion> sourcesList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tsource, sourcesList);
      });
  
  Future<int> deleteSource(int id) =>
      (delete(tsource)..where((t) => t.id.equals(id))).go();

  // Конвертация в модели
  Future<List<models.Source>> getAllSourceModels() async {
    final data = await getAllSources();
    return data.map((s) => models.Source(
      id: s.id,
      name: s.name,
      type: s.type,
      edition: s.edition,
      version: s.version,
      errataDate: s.errataDate,
      errataLink: s.errataLink,
    )).toList();
  }

}