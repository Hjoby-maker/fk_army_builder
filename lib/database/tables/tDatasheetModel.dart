import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetmodel extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get line => integer()();
  TextColumn get name => text()();
  IntColumn get move => integer()();
  IntColumn get toughness => integer()();
  TextColumn get save => text()();
  TextColumn get invulnerableSave => text().nullable()();
  TextColumn get invulnerableSaveDescription => text().nullable()();
  IntColumn get wounds => integer()();
  TextColumn get leadership => text()();
  IntColumn get objectiveControl => integer()();
  TextColumn get baseSize => text()();
  TextColumn get baseSizeDescription => text().nullable()();

  @override
  Set<Column> get primaryKey => {datasheetId, line};
}