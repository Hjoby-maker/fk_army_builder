import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetmodelcost extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get line => integer()();
  TextColumn get description => text().nullable()();
  IntColumn get cost => integer().nullable()();

@override
  Set<Column> get primaryKey => {datasheetId, line};
}
