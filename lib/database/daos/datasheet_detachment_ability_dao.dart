import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_detachment_ability_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetdetachmentability])
class DatasheetDetachmentAbilityDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetDetachmentAbilityDaoMixin {
  DatasheetDetachmentAbilityDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetdetachmentabilityData>> getAll() =>
      select(tdatasheetdetachmentability).get();

  Future<List<TdatasheetdetachmentabilityData>> getByDatasheetId(
          int datasheetId) =>
      (select(tdatasheetdetachmentability)
            ..where((t) => t.datasheetId.equals(datasheetId)))
          .get();

  Future<List<TdatasheetdetachmentabilityData>> getByDetachmentAbilityId(
          int detachmentAbilityId) =>
      (select(tdatasheetdetachmentability)
            ..where((t) => t.detachmentAbilityId.equals(detachmentAbilityId)))
          .get();

  Future<void> insertAll(List<TdatasheetdetachmentabilityCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetdetachmentability, entries);
      });

  Future<int> deleteByDatasheet(int datasheetId) =>
      (delete(tdatasheetdetachmentability)
            ..where((t) => t.datasheetId.equals(datasheetId)))
          .go();

  // Конвертация в модели
  Future<List<models.DatasheetDetachmentAbility>> getAllModels() async {
    final data = await getAll();
    return data
        .map((d) => models.DatasheetDetachmentAbility(
              datasheetId: d.datasheetId,
              detachmentAbilityId: d.detachmentAbilityId,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheetDetachmentAbility() async {
    final row_count = await customSelect(
            'select count(*) as count_ from tdatasheetdetachmentability;')
        .get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('TdatasheetDetachmentAbility count: ${_row.data['count_']} ');
    }
  }
}
