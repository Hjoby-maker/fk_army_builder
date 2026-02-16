import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdatasheetleader extends Table {
  IntColumn get leaderId => integer().references(Tdatasheet, #id)();
  IntColumn get attachedId => integer().references(Tdatasheet, #id)();

  @override
  Set<Column> get primaryKey => {leaderId, attachedId};
}
