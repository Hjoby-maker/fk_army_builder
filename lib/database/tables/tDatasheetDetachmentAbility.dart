import 'package:drift/drift.dart';
import 'tDatasheet.dart';
import 'tDetachmentAbility.dart';

class Tdatasheetdetachmentability extends Table {
  IntColumn get datasheetId => integer().references(Tdatasheet, #id)();
  IntColumn get detachmentAbilityId => integer().references(Tdetachmentability, #id)();
}