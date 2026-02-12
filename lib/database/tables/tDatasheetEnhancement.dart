import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetenhancement extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get enhancementId => integer().references(Tenhancement, #id)();
}
