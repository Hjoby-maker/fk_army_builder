import 'package:drift/drift.dart';
import 'tFaction.dart';

class Tability extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get legend => text().nullable()();
  TextColumn get factionId => text().references(Tfaction, #id)();
  TextColumn get description => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}