import 'package:drift/drift.dart';
import 'tDatasheet.dart';

class Tdatasheetoption extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get line => integer()();
  TextColumn get button => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {datasheetId, line};
}