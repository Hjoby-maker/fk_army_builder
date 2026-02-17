import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_model_cost_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetmodelcost])
class DatasheetModelCostDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetModelCostDaoMixin {
  DatasheetModelCostDao(super.db);

  // CRUD
  Future<List<TdatasheetmodelcostData>> getAllCosts() =>
      select(tdatasheetmodelcost).get();

  Future<TdatasheetmodelcostData?> getCostByIdAndLine(
          int datasheetId, int line) =>
      (select(tdatasheetmodelcost)
            ..where(
                (t) => t.datasheetId.equals(datasheetId) & t.line.equals(line)))
          .getSingleOrNull();

  Future<void> insertAllCosts(List<TdatasheetmodelcostCompanion> costsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetmodelcost, costsList);
      });

  Future<int> deleteCostByIdAndLine(int datasheetId, int line) => (delete(
          tdatasheetmodelcost)
        ..where((t) => t.datasheetId.equals(datasheetId) & t.line.equals(line)))
      .go();

  // Конвертация в модели
  Future<List<models.DatasheetModelCost>> getAllCostModels() async {
    final data = await getAllCosts();
    return data
        .map((c) => models.DatasheetModelCost(
              datasheetId: c.datasheetId,
              line: c.line,
              description: c.description,
              cost: c.cost,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheetModelCost() async {
    final rowCount = await customSelect(
            'select count(*) as count_ from tdatasheetmodelcost;')
        .get();
    // row.data – Map<String, dynamic>
    for (final _row in rowCount) {
      print('TdatasheetModelCost count: ${_row.data['count_']} ');
    }
  }
}
