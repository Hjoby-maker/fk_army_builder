import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tenhancement extends Table{
  TextColumn get factionId => text().references(Tfaction, #id)();
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get cost => integer()();
  TextColumn get detachment => text().nullable()();
  IntColumn get detachmentId => integer().references(Tdetachment, #id).nullable()();
  TextColumn get legend => text().nullable()();
  TextColumn get description => text().nullable()();
 
  @override
  Set<Column> get primaryKey => {id};
  }