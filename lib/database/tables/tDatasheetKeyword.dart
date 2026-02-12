import 'package:drift/drift.dart';
import 'package:fk_army_builder/database/converters/bool_converter.dart';
import 'tIndex.dart';

class Tdatasheetkeyword extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  TextColumn get keyword => text().nullable()();
  TextColumn get model => text().nullable()();
  @BoolIntConverter()
  BoolColumn get isFactionKeyword => boolean()();
}