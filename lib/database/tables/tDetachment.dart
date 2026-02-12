import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tdetachment extends Table {
  IntColumn get  id => integer()();
  TextColumn get factionId => text().references(Tfaction, #id)();
  TextColumn get  name => text().withLength(min: 1, max: 200)();
  TextColumn get legend => text().nullable()();
  TextColumn get type => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}