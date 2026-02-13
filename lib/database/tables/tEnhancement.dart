import 'package:drift/drift.dart';
import 'tIndex.dart';

class Tenhancement extends Table{
  TextColumn get factionId => text().references(Tfaction, #id)();
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get cost => integer()();
  TextColumn get detachment => text()();
  IntColumn get detachmentId => integer().references(Tdetachment, #id)();
  TextColumn get legend => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
  }