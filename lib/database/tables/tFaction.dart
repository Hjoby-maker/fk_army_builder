import 'package:drift/drift.dart';

class Tfaction extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get link => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}