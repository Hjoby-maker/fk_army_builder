import 'package:drift/drift.dart';
import 'package:fk_army_builder/database/converters/date_time_converter.dart';

class Tlastupdate extends Table {
  @DateTimeConverter()
  DateTimeColumn get lastUpdate => dateTime()();
}