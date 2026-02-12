import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'stratagem_dao.g.dart';

@DriftAccessor(tables: [Tstratagem])
class StratagemDao extends DatabaseAccessor<AppDatabase> with _$StratagemDaoMixin {
  StratagemDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TstratagemData>> getAllStratagems() => select(tstratagem).get();
  
  Future<TstratagemData?> getStratagemById(String id) =>
      (select(tstratagem)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertStratagem(TstratagemCompanion stratagem) =>
      into(tstratagem).insert(stratagem);
  
  Future<void> insertAllStratagems(List<TstratagemCompanion> stratagemsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tstratagem, stratagemsList);
      });
  
  Future<int> deleteStratagem(String id) =>
      (delete(tstratagem)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TstratagemData>> searchStratagems(String query) =>
      (select(tstratagem)
        ..where((t) => t.name.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.name)])
      ).get();
  
  Future<List<TstratagemData>> getStratagemsByDetachment(String detachmentId) =>
      (select(tstratagem)..where((t) => t.detachmentId.equals(detachmentId))).get();

  // Конвертация в модели
  Future<List<models.Stratagem>> getAllStratagemModels() async {
    final data = await getAllStratagems();
    return data.map((s) => models.Stratagem(
      id: s.id,
      name: s.name,
      description: s.description,
      detachmentId: s.detachmentId,
      sourceId: s.sourceId,
      link: s.link,
      cpCost: s.cpCost,
      when: s.when,
      target: s.target,
      effect: s.effect,
      restrictions: s.restrictions,
    )).toList();
  }

}