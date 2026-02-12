import 'package:drift/drift.dart';
import 'tAbility.dart';

class Tdatasheetability extends Table {
  IntColumn get datasheetId => integer()();
  IntColumn get line => integer()();
  IntColumn get abilityId => integer().references(Tability, #id)();
  TextColumn get  model => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get parameter => text().nullable()();
}