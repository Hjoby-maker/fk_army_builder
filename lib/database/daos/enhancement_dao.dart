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
  
  Future<TenhancementData?> getEnhancementById(String id) =>
      (select(tenhancement)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertEnhancement(TenhancementCompanion enhancement) =>
      into(tenhancement).insert(enhancement);
  
  Future<void> insertAllEnhancements(List<TenhancementCompanion> enhancementsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tenhancement, enhancementsList);
      });
  
  Future<int> deleteEnhancement(String id) =>
      (delete(tenhancement)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TenhancementData>> searchEnhancements(String query) =>
      (select(tenhancement)
        ..where((t) => t.name.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.name)])
      ).get();
  
  Future<List<TenhancementData>> getEnhancementsByDetachment(String detachmentId) =>
      (select(tenhancement)..where((t) => t.detachmentId.equals(detachmentId))).get();

  // Конвертация в модели
  Future<List<models.Enhancement>> getAllEnhancementModels() async {
    final data = await getAllEnhancements();
    return data.map((e) => models.Enhancement(
      id: e.id,
      name: e.name,
      description: e.description,
      detachmentId: e.detachmentId,
      sourceId: e.sourceId,
      link: e.link,
      cost: e.cost,
    )).toList();
  }

  Future<void> dropAndRecreateTable() async {
    await customStatement('DROP TABLE IF EXISTS tenhancement');
    await customStatement('''
      CREATE TABLE tenhancement (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        detachment_id TEXT,
        source_id TEXT,
        link TEXT,
        cost INTEGER
      )
    ''');
    print('Таблица tenhancement пересоздана');
  }
}