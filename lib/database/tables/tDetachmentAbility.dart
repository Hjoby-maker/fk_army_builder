import 'package:drift/drift.dart';
import 'tFaction.dart';
import 'tDetachment.dart';

class Tdetachmentability extends Table {
  IntColumn get  id => integer()();
  TextColumn get factionId => text().references(Tfaction, #id)();
  TextColumn get  name => text().withLength(min: 1, max: 200)();
  TextColumn get legend => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get detachment => text().nullable()();
  IntColumn get detachmentId => integer().references(Tdetachment, #id).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}