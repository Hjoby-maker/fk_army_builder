import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'stratagem_dao.g.dart';

@DriftAccessor(tables: [Tstratagem])
class StratagemDao extends DatabaseAccessor<AppDatabase>
    with _$StratagemDaoMixin {
  StratagemDao(super.db);

  // CRUD
  Future<List<TstratagemData>> getAllStratagems() => select(tstratagem).get();

  Future<TstratagemData?> getStratagemById(int id) =>
      (select(tstratagem)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertStratagem(TstratagemCompanion stratagem) =>
      into(tstratagem).insert(stratagem);

  Future<void> insertAllStratagems(List<TstratagemCompanion> stratagemsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tstratagem, stratagemsList);
      });

  Future<int> deleteStratagem(int id) =>
      (delete(tstratagem)..where((t) => t.id.equals(id))).go();

  Future<List<TstratagemData>> getStratagemsByDetachment(int detachmentId) =>
      (select(tstratagem)..where((t) => t.detachmentId.equals(detachmentId)))
          .get();

  Future<List<TstratagemData>> getStratagemsByFaction(String factionId) =>
      (select(tstratagem)..where((t) => t.factionId.equals(factionId))).get();

  // Конвертация в модели
  Future<List<models.Stratagem>> getAllStratagemModels() async {
    final data = await getAllStratagems();
    return data
        .map((s) => models.Stratagem(
              factionId: s.factionId,
              name: s.name,
              id: s.id,
              type: s.type,
              commandPointCost: s.commandPointCost,
              legend: s.legend,
              turn: s.turn,
              phase: s.phase,
              detachment: s.detachment,
              detachmentId: s.detachmentId,
              description: s.description,
            ))
        .toList();
  }

  Future<void> debugLenTstratagem() async {
    final rowCount =
        await customSelect('select count(*) as count_ from tstratagem;').get();
    // row.data – Map<String, dynamic>
    for (final _row in rowCount) {
      print('tstratagem count: ${_row.data['count_']} ');
    }
  }
}
