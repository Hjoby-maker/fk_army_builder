import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetwargear extends Table {
  IntColumn get  datasheetId => integer().references(Tdatasheet,#id)();
  IntColumn get line => integer().nullable()();
  IntColumn get lineInWargear => integer().nullable()();
  TextColumn get dice => text().withLength(min: 1, max: 200)();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get range => integer().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get attacks => integer().nullable()();
  TextColumn get ballisticSkill => text().nullable()();
  IntColumn get strength => integer().nullable()();
  IntColumn get armorPenetration => integer().nullable()();
  TextColumn get damage => text().nullable()();
}