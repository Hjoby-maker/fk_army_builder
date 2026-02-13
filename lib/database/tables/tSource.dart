import 'package:drift/drift.dart';

class Tsource extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get type => text().nullable()();
  IntColumn get edition => integer().nullable()();
  TextColumn get version => text().nullable()();
  DateTimeColumn get errataDate => dateTime().nullable()();
  TextColumn get errataLink => text().nullable()();
   
  @override
  Set<Column> get primaryKey => {id};
}