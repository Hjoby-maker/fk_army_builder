import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'last_update_dao.g.dart';

@DriftAccessor(tables: [Tlastupdate])
class LastUpdateDao extends DatabaseAccessor<AppDatabase>
    with _$LastUpdateDaoMixin {
  LastUpdateDao(super.db);

  // CRUD
  Future<List<TlastupdateData>> getAllLastUpdates() =>
      select(tlastupdate).get();

  Future<int> insertLastUpdate(TlastupdateCompanion lastUpdate) =>
      into(tlastupdate).insert(lastUpdate);

  Future<void> insertAllLastUpdates(
          List<TlastupdateCompanion> lastUpdatesList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tlastupdate, lastUpdatesList);
      });

  // Специальные методы
  Future<TlastupdateData?> getLatestUpdate() => (select(tlastupdate)
        ..orderBy([
          (t) => OrderingTerm(expression: t.lastUpdate, mode: OrderingMode.desc)
        ])
        ..limit(1))
      .getSingleOrNull();

  // Конвертация в модели
  Future<List<models.LastUpdate>> getAllLastUpdateModels() async {
    final data = await getAllLastUpdates();
    return data
        .map((l) => models.LastUpdate(
              lastUpdate: l.lastUpdate,
            ))
        .toList();
  }

  Future<void> debugLenTlastUpdate() async {
    final rowCount =
        await customSelect('select count(*) as count_ from tlastupdate;').get();
    // row.data – Map<String, dynamic>
    for (final _row in rowCount) {
      print('tlastupdate count: ${_row.data['count_']} ');
    }
  }

  //Получить последнюю дату как DateTime
  Future<DateTime?> getLastUpdateDate() async {
    final query = select(tlastupdate)
      ..orderBy([
        (t) => OrderingTerm(expression: t.lastUpdate, mode: OrderingMode.desc)
      ])
      ..limit(1);

    final result = await query.getSingleOrNull();
    return result?.lastUpdate;
  }

  //Проверить, есть ли обновления после указанной даты
  Future<bool> hasUpdatesAfter(DateTime date) async {
    final query = select(tlastupdate)
      ..where((t) => t.lastUpdate.isBiggerThanValue(date))
      ..limit(1);

    final result = await query.get();
    return result.isNotEmpty;
  }
}
