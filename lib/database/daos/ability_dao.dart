import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'ability_dao.g.dart';

@DriftAccessor(tables: [Tability])
class AbilityDao extends DatabaseAccessor<AppDatabase> with _$AbilityDaoMixin {
  AbilityDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TabilityData>> getAllAbilities() => select(tability).get();

  Future<TabilityData?> getAbilityById(int id) =>
      (select(tability)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertAbility(TabilityCompanion ability) =>
      into(tability).insert(ability);

  Future<void> insertAllAbilities(List<TabilityCompanion> abilitiesList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tability, abilitiesList);
      });

  Future<int> deleteAbility(int id) =>
      (delete(tability)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TabilityData>> searchAbilities(String query) => (select(tability)
        ..where((t) => t.name.like('%$query%') | t.description.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.name)]))
      .get();

  Future<void> debugLenTability() async {
    /*final result = await customSelect('PRAGMA table_info(tability);').get();
    for (final row in result) {
      // row.data – Map<String, dynamic>
      print('col: ${row.data['name']} | type: ${row.data['type']}');
    }*/
    final row_count =
        await customSelect('select count(*) as count_ from tability;').get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('Ability count: ${_row.data['count_']} ');
    }
  }

  // Конвертация в модели
  Future<List<models.Ability>> getAllAbilityModels() async {
    final data = await getAllAbilities();
    return data
        .map((a) => models.Ability(
              id: a.id,
              name: a.name,
              legend: a.legend,
              factionId: a.factionId,
              description: a.description,
            ))
        .toList();
  }
}
