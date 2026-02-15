import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tstratagem extends Table {
  TextColumn get  factionId => text().nullable()();
  TextColumn get name => text().nullable()();
  IntColumn get  id => integer()();
  TextColumn get type => text().nullable()();
  IntColumn get commandPointCost => integer().nullable()();
  TextColumn get legend => text().nullable()();
  TextColumn get turn => text().nullable()();
  TextColumn get phase => text().nullable()();
  TextColumn get detachment => text().nullable()();
  IntColumn get detachmentId => integer().references(Tdetachment, #id).nullable()();
  TextColumn get description => text().nullable()();
   
  @override
  Set<Column> get primaryKey => {id};
}