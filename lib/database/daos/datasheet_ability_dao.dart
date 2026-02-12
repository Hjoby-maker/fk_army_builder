import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_ability_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetability])
class DatasheetAbilityDao extends DatabaseAccessor<AppDatabase> with _$DatasheetAbilityDaoMixin {
  DatasheetAbilityDao(AppDatabase db) : super(db);

  Future<List<TdatasheetabilityData>> getAll() => select(tdatasheetability).get();
  
  Future<List<TdatasheetabilityData>> getByDatasheetId(String datasheetId) =>
      (select(tdatasheetability)..where((t) => t.datasheetId.equals(datasheetId))).get();
  
  Future<List<TdatasheetabilityData>> getByAbilityId(String abilityId) =>
      (select(tdatasheetability)..where((t) => t.abilityId.equals(abilityId))).get();
  
  Future<void> insertAll(List<TdatasheetabilityCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetability, entries);
      });
  
  Future<int> deleteByDatasheet(String datasheetId) =>
      (delete(tdatasheetability)..where((t) => t.datasheetId.equals(datasheetId))).go();

}