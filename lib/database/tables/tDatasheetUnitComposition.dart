import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetunitcomposition extends Table {
  IntColumn get datasheetIdid => integer().references(Tdatasheet, #id)();
  IntColumn get line => integer()();
  TextColumn get description => text().withLength(min: 1, max: 200)();
}