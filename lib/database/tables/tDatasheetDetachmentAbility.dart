import 'package:drift/drift.dart';
import 'tDatasheet.dart';
import 'tDetachmentAbility.dart';

class Tdatasheetdetachmentability extends Table {
  IntColumn get datasheetId =>
      integer().named('datasheetId').references(Tdatasheet, #id)();
  IntColumn get detachmentAbilityId => integer()
      .named('detachmentAbilityId')
      .references(Tdetachmentability, #id)();

  @override
  Set<Column> get primaryKey => {datasheetId, detachmentAbilityId};
}
