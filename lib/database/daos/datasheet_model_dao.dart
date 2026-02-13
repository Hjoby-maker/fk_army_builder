import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_model_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetmodel])
class DatasheetModelDao extends DatabaseAccessor<AppDatabase> with _$DatasheetModelDaoMixin {
  DatasheetModelDao(AppDatabase db) : super(db);

  Future<List<TdatasheetmodelData>> getAll() => select(tdatasheetmodel).get();
  
  Future<List<TdatasheetmodelData>> getByDatasheetId(int datasheetId) =>
      (select(tdatasheetmodel)..where((t) => t.datasheetId.equals(datasheetId))).get();
  
  Future<void> insertAll(List<TdatasheetmodelCompanion> entries) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetmodel, entries);
      });

  Future<List<models.DatasheetModel>> getAllDatasheetModels() async {
    final data = await getAll();
    return data.map((f) => models.DatasheetModel(
      datasheetId: f.datasheetId,
      line: f.line,
      name: f.name,
      move: f.move,
      toughness: f.toughness,
      save: f.save,
      invulnerableSave: f.invulnerableSave,
      invulnerableSaveDescription: f.invulnerableSaveDescription,
      wounds: f.wounds,
      leadership: f.leadership,
      objectiveControl: f.objectiveControl,
      baseSize: f.baseSize,
      baseSizeDescription: f.baseSizeDescription,
    )).toList();
  }

}