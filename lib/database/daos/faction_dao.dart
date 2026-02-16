import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'faction_dao.g.dart';

@DriftAccessor(tables: [Tfaction])
class FactionDao extends DatabaseAccessor<AppDatabase> with _$FactionDaoMixin {
  FactionDao(super.db);

  // Базовые CRUD операции
  Future<List<TfactionData>> getAllFactions() => select(tfaction).get();

  Future<TfactionData?> getFactionById(String id) {
    return (select(tfaction)..where((f) => f.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertFaction(TfactionCompanion faction) {
    return into(tfaction).insert(faction);
  }

  Future<void> insertAllFactions(List<TfactionCompanion> factionsList) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(tfaction, factionsList);
    });
  }

  Future<int> deleteFaction(String id) {
    return (delete(tfaction)..where((f) => f.id.equals(id))).go();
  }

  // Поиск
  Future<List<TfactionData>> searchFactions(String query) {
    return (select(tfaction)
          ..where((f) => f.name.like('%$query%'))
          ..orderBy([(f) => OrderingTerm(expression: f.name)]))
        .get();
  }

  Future<List<models.Faction>> getAllFactionModels() async {
    final data = await getAllFactions();
    return data
        .map((f) => models.Faction(
              id: f.id,
              name: f.name,
              link: f.link,
            ))
        .toList();
  }

  Future<void> debugLenTfaction() async {
    final row_count =
        await customSelect('select count(*) as count_ from tfaction;').get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('tfaction count: ${_row.data['count_']} ');
    }
  }
}
