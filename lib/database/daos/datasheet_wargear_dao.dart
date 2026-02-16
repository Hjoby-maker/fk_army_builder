import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_wargear_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetwargear])
class DatasheetWargearDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetWargearDaoMixin {
  DatasheetWargearDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetwargearData>> getAllWargear() =>
      select(tdatasheetwargear).get();

  Future<List<TdatasheetwargearData>> getWargearById(
          int datasheetId, int lineInWargear) =>
      (select(tdatasheetwargear)
            ..where((t) =>
                t.datasheetId.equals(datasheetId) &
                t.lineInWargear.equals(lineInWargear)))
          .get();

  Future<void> insertAllWargear(List<TdatasheetwargearCompanion> wargearList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetwargear, wargearList);
      });

  Future<int> deleteWargearById(int datasheetId, int lineInWargear) =>
      (delete(tdatasheetwargear)
            ..where((t) =>
                t.datasheetId.equals(datasheetId) &
                t.lineInWargear.equals(lineInWargear)))
          .go();

  // Поиск
  Future<List<TdatasheetwargearData>> searchWargearByName(String query) =>
      (select(tdatasheetwargear)
            ..where((t) => t.name.like('%$query%'))
            ..orderBy([(t) => OrderingTerm(expression: t.name)]))
          .get();

  // Конвертация в модели
  Future<List<models.DatasheetWargear>> getAllWargearModels() async {
    final data = await getAllWargear();
    return data
        .map((w) => models.DatasheetWargear(
              datasheetId: w.datasheetId,
              line: w.line,
              lineInWargear: w.lineInWargear,
              dice: w.dice,
              name: w.name,
              description: w.description,
              range: w.range,
              type: w.type,
              attacks: w.attacks,
              ballisticSkill: w.ballisticSkill,
              strength: w.strength,
              armorPenetration: w.armorPenetration,
              damage: w.damage,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheetWargear() async {
    final row_count =
        await customSelect('select count(*) as count_ from tdatasheetwargear;')
            .get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('TdatasheetWargear count: ${_row.data['count_']} ');
    }
  }
}
