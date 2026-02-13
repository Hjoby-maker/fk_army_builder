import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'enhancement_dao.g.dart';

@DriftAccessor(tables: [Tenhancement])
class EnhancementDao extends DatabaseAccessor<AppDatabase> with _$EnhancementDaoMixin {
  EnhancementDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TenhancementData>> getAllEnhancements() => select(tenhancement).get();
  
  Future<TenhancementData?> getEnhancementById(int id) =>
      (select(tenhancement)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<void> insertAllEnhancements(List<TenhancementCompanion> enhancementsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tenhancement, enhancementsList);
      });
  
  Future<int> deleteEnhancement(int id) =>
      (delete(tenhancement)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TenhancementData>> searchEnhancements(String query) =>
      (select(tenhancement)
        ..where((t) => t.name.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.name)])
      ).get();
  
  Future<List<TenhancementData>> getEnhancementsByDetachment(int detachmentId) =>
      (select(tenhancement)..where((t) => t.detachmentId.equals(detachmentId))).get();

  // Конвертация в модели
  Future<List<models.Enhancement>> getAllEnhancementModels() async {
    final data = await getAllEnhancements();
    return data.map((e) => models.Enhancement(
      factionId: e.factionId,
      id: e.id,
      name: e.name,
      cost: e.cost,
      detachment: e.detachment,
      detachmentId: e.detachmentId,
      legend: e.legend,
      description: e.description,
    )).toList();
  }

}