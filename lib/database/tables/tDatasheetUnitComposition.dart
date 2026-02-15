import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetunitcomposition extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get line => integer()();
  TextColumn get description => text().withLength(min: 1, max: 200).nullable()();

  @override
  Set<Column> get primaryKey => {datasheetId, line};
}