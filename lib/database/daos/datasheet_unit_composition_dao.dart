import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_unit_composition_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetunitcomposition])
class DatasheetUnitCompositionDao extends DatabaseAccessor<AppDatabase> with _$DatasheetUnitCompositionDaoMixin {
  DatasheetUnitCompositionDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetunitcompositionData>> getAll() => select(tdatasheetunitcomposition).get();
  
  Future<List<TdatasheetunitcompositionData>> getByPK(int datasheetId, int line) =>
      (select(tdatasheetunitcomposition)
      ..where((t) => t.datasheetId.equals(datasheetId)& t.line.equals(line))
      ).get();
  
  Future<void> insertAll(List<TdatasheetunitcompositionCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetunitcomposition, entries);
      });
  
  Future<int> deleteByPK(int datasheetId, int line) =>
      (delete(tdatasheetunitcomposition)
      ..where((t) => t.datasheetId.equals(datasheetId)& t.line.equals(line))
      ).go();

  // Конвертация в модели
  Future<List<models.DatasheetUnitComposition>> getAllModels() async {
    final data = await getAll();
    return data.map((c) => models.DatasheetUnitComposition(
      datasheetId: c.datasheetId,
      line: c.line,
      description: c.description,
    )).toList();
  }
}