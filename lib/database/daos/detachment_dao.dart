import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'detachment_dao.g.dart';

@DriftAccessor(tables: [Tdetachment])
class DetachmentDao extends DatabaseAccessor<AppDatabase> with _$DetachmentDaoMixin {
  DetachmentDao(AppDatabase db) : super(db);

  // CRUD 
  Future<List<TdetachmentData>> getAllDetachments() => select(tdetachment).get();
  
  Future<TdetachmentData?> getDetachmentById(int id) =>
      (select(tdetachment)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<void> insertAllDetachments(List<TdetachmentCompanion> detachmentsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdetachment, detachmentsList);
      });
  
  Future<int> deleteDetachment(int id) =>
      (delete(tdetachment)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TdetachmentData>> searchDetachments(String query) =>
      (select(tdetachment)
        ..where((t) => t.name.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.name)])
      ).get();
  
  Future<List<TdetachmentData>> getDetachmentsByFaction(String factionId) =>
      (select(tdetachment)..where((t) => t.factionId.equals(factionId))).get();

  // Конвертация в модели
  Future<List<models.Detachment>> getAllDetachmentModels() async {
    final data = await getAllDetachments();
    return data.map((d) => models.Detachment(
      id: d.id,
      factionId: d.factionId,
      name: d.name,
      legend: d.legend,
      type: d.type,
    )).toList();
  }
}