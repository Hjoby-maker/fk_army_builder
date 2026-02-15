import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetwargear extends Table {
  IntColumn get  datasheetId => integer().references(Tdatasheet,#id)();
  IntColumn get line => integer().nullable()();
  IntColumn get lineInWargear => integer()();
  TextColumn get dice => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get range => integer().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get attacks => integer().nullable()();
  TextColumn get ballisticSkill => text().nullable()();
  IntColumn get strength => integer().nullable()();
  IntColumn get armorPenetration => integer().nullable()();
  TextColumn get damage => text().nullable()();

  @override
  Set<Column> get primaryKey => {datasheetId, lineInWargear};
}