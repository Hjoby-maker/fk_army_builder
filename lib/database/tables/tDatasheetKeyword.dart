import 'package:drift/drift.dart';
import 'package:fk_army_builder/database/converters/bool_converter.dart';
import 'tIndex.dart';

class Tdatasheetkeyword extends Table {
  IntColumn get id => integer().autoIncrement()(); // автоинкрементный ID
  IntColumn get datasheetId =>
      integer().references(Tdatasheet, #id).named('datasheetId')();
  TextColumn get keyword => text().nullable()();
  TextColumn get model => text().nullable()();
  @BoolIntConverter()
  BoolColumn get isFactionKeyword => boolean().named('isFactionKeyword')();

  @override
  Set<Column> get primaryKey => {id};
}
