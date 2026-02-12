import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_model_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetmodel])
class DatasheetModelDao extends DatabaseAccessor<AppDatabase> with _$DatasheetModelDaoMixin {
  DatasheetModelDao(AppDatabase db) : super(db);

  Future<List<TdatasheetmodelData>> getAll() => select(tdatasheetmodel).get();
  
  Future<List<TdatasheetmodelData>> getByDatasheetId(String datasheetId) =>
      (select(tdatasheetmodel)..where((t) => t.datasheetId.equals(datasheetId))).get();
  
  Future<void> insertAll(List<TdatasheetmodelCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetmodel, entries);
      });

}