import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetstratagem extends Table {
  IntColumn get  datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get stratagemId => integer().references(Tstratagem, #id)();
}