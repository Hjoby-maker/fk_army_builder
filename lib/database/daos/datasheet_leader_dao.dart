import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_leader_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetleader])
class DatasheetLeaderDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetLeaderDaoMixin {
  DatasheetLeaderDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetleaderData>> getAllLeaders() =>
      select(tdatasheetleader).get();

  Future<List<TdatasheetleaderData>> getLeadersByLeaderId(int leaderId) =>
      (select(tdatasheetleader)..where((t) => t.leaderId.equals(leaderId)))
          .get();

  Future<List<TdatasheetleaderData>> getLeadersByAttachedId(int attachedId) =>
      (select(tdatasheetleader)..where((t) => t.attachedId.equals(attachedId)))
          .get();

  Future<void> insertAllLeaders(List<TdatasheetleaderCompanion> leadersList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetleader, leadersList);
      });

  Future<int> deleteLeadersByLeader(int leaderId) =>
      (delete(tdatasheetleader)..where((t) => t.leaderId.equals(leaderId)))
          .go();

  // Конвертация в модели
  Future<List<models.DatasheetLeader>> getAllLeaderModels() async {
    final data = await getAllLeaders();
    return data
        .map((l) => models.DatasheetLeader(
              leaderId: l.leaderId,
              attachedId: l.attachedId,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheetLeader() async {
    final row_count =
        await customSelect('select count(*) as count_ from tdatasheetleader;')
            .get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('tdatasheetleader count: ${_row.data['count_']} ');
    }
  }
}
