import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'lastupdate_dao.g.dart';

@DriftAccessor(tables: [Tlastupdate])
class LastUpdateDao extends DatabaseAccessor<AppDatabase> with _$LastUpdateDaoMixin {
  LastUpdateDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TlastupdateData>> getAllLastUpdates() => select(tlastupdate).get();
  
  Future<TlastupdateData?> getLastUpdateById(int id) =>
      (select(tlastupdate)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertLastUpdate(TlastupdateCompanion lastUpdate) =>
      into(tlastupdate).insert(lastUpdate);
  
  Future<void> insertAllLastUpdates(List<TlastupdateCompanion> lastUpdatesList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tlastupdate, lastUpdatesList);
      });
  
  Future<int> deleteLastUpdate(int id) =>
      (delete(tlastupdate)..where((t) => t.id.equals(id))).go();

  // Специальные методы
  Future<TlastupdateData?> getLatestUpdate() =>
      (select(tlastupdate)
        ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)])
        ..limit(1)
      ).getSingleOrNull();

  // Конвертация в модели
  Future<List<models.LastUpdate>> getAllLastUpdateModels() async {
    final data = await getAllLastUpdates();
    return data.map((l) => models.LastUpdate(
      id: l.id,
      date: l.date,
    )).toList();
  }
} 