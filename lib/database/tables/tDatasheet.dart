import 'package:drift/drift.dart';
import 'tFaction.dart';
import 'tSource.dart';

class Tdatasheet extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get factionId =>
      text().references(Tfaction, #id).named('factionId')();
  IntColumn get sourceId => integer().references(Tsource, #id)();
  TextColumn get legend => text().nullable()();
  TextColumn get role => text().nullable()();
  TextColumn get loadout => text().nullable()();
  TextColumn get transport => text().nullable()();
  BoolColumn get virtual => boolean().nullable()();
  TextColumn get leaderHead => text().nullable()();
  TextColumn get leaderFooter => text().nullable()();
  TextColumn get damagedW => text().nullable()();
  TextColumn get damagedDescription => text().nullable()();
  TextColumn get link => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
