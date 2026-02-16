import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_enhancement_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetenhancement])
class DatasheetEnhancementDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetEnhancementDaoMixin {
  DatasheetEnhancementDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetenhancementData>> getAll() =>
      select(tdatasheetenhancement).get();

  Future<List<TdatasheetenhancementData>> getByDatasheetId(int datasheetId) =>
      (select(tdatasheetenhancement)
            ..where((t) => t.datasheetId.equals(datasheetId)))
          .get();

  Future<List<TdatasheetenhancementData>> getByEnhancementId(
          int enhancementId) =>
      (select(tdatasheetenhancement)
            ..where((t) => t.enhancementId.equals(enhancementId)))
          .get();

  Future<void> insertAll(List<TdatasheetenhancementCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetenhancement, entries);
      });

  Future<int> deleteByDatasheet(int datasheetId) =>
      (delete(tdatasheetenhancement)
            ..where((t) => t.datasheetId.equals(datasheetId)))
          .go();

  // Конвертация в модели
  Future<List<models.DatasheetEnhancement>> getAllModels() async {
    final data = await getAll();
    return data
        .map((e) => models.DatasheetEnhancement(
              datasheetId: e.datasheetId,
              enhancementId: e.enhancementId,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheetEnhancement() async {
    final row_count = await customSelect(
            'select count(*) as count_ from tdatasheetenhancement;')
        .get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('TdatasheetEnhancement count: ${_row.data['count_']} ');
    }
  }
}
