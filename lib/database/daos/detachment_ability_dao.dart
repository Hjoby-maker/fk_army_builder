import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'detachment_ability_dao.g.dart';

@DriftAccessor(tables: [Tdetachmentability])
class DetachmentAbilityDao extends DatabaseAccessor<AppDatabase>
    with _$DetachmentAbilityDaoMixin {
  DetachmentAbilityDao(super.db);

  // CRUD
  Future<List<TdetachmentabilityData>> getAllDetachmentAbilities() =>
      select(tdetachmentability).get();

  Future<TdetachmentabilityData?> getDetachmentAbilityById(int id) =>
      (select(tdetachmentability)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<List<TdetachmentabilityData>> getAbilitiesByDetachmentId(
          int detachmentId) =>
      (select(tdetachmentability)
            ..where((t) => t.detachmentId.equals(detachmentId)))
          .get();

  Future<int> insertDetachmentAbility(TdetachmentabilityCompanion ability) =>
      into(tdetachmentability).insert(ability);

  Future<void> insertAllDetachmentAbilities(
          List<TdetachmentabilityCompanion> abilitiesList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdetachmentability, abilitiesList);
      });

  Future<int> deleteDetachmentAbility(int id) =>
      (delete(tdetachmentability)..where((t) => t.id.equals(id))).go();

  // Поиск
  Future<List<TdetachmentabilityData>> searchDetachmentAbilities(
          String query) =>
      (select(tdetachmentability)
            ..where(
                (t) => t.name.like('%$query%') | t.description.like('%$query%'))
            ..orderBy([(t) => OrderingTerm(expression: t.name)]))
          .get();

  // Конвертация в модели
  Future<List<models.DetachmentAbility>> getAllDetachmentAbilityModels() async {
    final data = await getAllDetachmentAbilities();
    return data
        .map((a) => models.DetachmentAbility(
              id: a.id,
              factionId: a.factionId,
              name: a.name,
              legend: a.legend,
              description: a.description,
              detachment: a.detachment,
              detachmentId: a.detachmentId,
            ))
        .toList();
  }

  Future<void> debugLenTdetachmentAbility() async {
    final rowCount =
        await customSelect('select count(*) as count_ from tdetachmentability;')
            .get();
    // row.data – Map<String, dynamic>
    for (final _row in rowCount) {
      print('tDetachmentAbility count: ${_row.data['count_']} ');
    }
  }
}
