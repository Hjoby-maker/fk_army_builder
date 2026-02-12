import 'package:drift/drift.dart';

class BoolIntConverter extends TypeConverter<bool, int> {
  const BoolIntConverter();
  
  @override
  bool fromSql(int fromDb) => fromDb == 1;
  
  @override
  int toSql(bool value) => value ? 1 : 0;
}