import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_stratagem_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetstratagem])
class DatasheetStratagemDao extends DatabaseAccessor<AppDatabase> with _$DatasheetStratagemDaoMixin {
  DatasheetStratagemDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetstratagemData>> getAll() => select(tdatasheetstratagem).get();
  
  Future<List<TdatasheetstratagemData>> getByDatasheetId(int datasheetId) =>
      (select(tdatasheetstratagem)..where((t) => t.datasheetId.equals(datasheetId))).get();
  
  Future<List<TdatasheetstratagemData>> getByStratagemId(int stratagemId) =>
      (select(tdatasheetstratagem)..where((t) => t.stratagemId.equals(stratagemId))).get();
  
  Future<void> insertAll(List<TdatasheetstratagemCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetstratagem, entries);
      });
  
  Future<int> deleteByPK(int datasheetId, int stratagemId) =>
      (delete(tdatasheetstratagem)
      ..where((t) => t.datasheetId.equals(datasheetId) & t.stratagemId.equals(stratagemId))
      ).go();

  // Конвертация в модели
  Future<List<models.DatasheetStratagem>> getAllModels() async {
    final data = await getAll();
    return data.map((s) => models.DatasheetStratagem(
      datasheetId: s.datasheetId,
      stratagemId: s.stratagemId,
    )).toList();
  }
} 