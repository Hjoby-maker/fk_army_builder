// lib/database/database.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fk_army_builder/database/daos/datasheet_ability_dao.dart';
import 'package:fk_army_builder/database/daos/datasheet_model_dao.dart';
import 'package:fk_army_builder/database/daos/detachment_dao.dart';
import 'package:fk_army_builder/database/daos/enhancement_dao.dart';
import 'package:fk_army_builder/database/daos/last_update_dao.dart';
import 'package:fk_army_builder/database/daos/source_dao.dart';
import 'package:fk_army_builder/database/daos/stratagem_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables/tIndex.dart';
import 'daos/index_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Tfaction,
    Tdatasheet,
    Tability,
    Tdetachment,
    Tenhancement,
    Tstratagem,
    Tsource,
    Tlastupdate,
    Tdatasheetability,
    Tdatasheetmodel,
    Tdatasheetwargear,
    Tdatasheetkeyword,
    Tdatasheetoption,
    Tdatasheetleader,
    Tdatasheetstratagem,
    Tdatasheetenhancement,
    Tdatasheetdetachmentability,
    Tdatasheetunitcomposition,
    Tdatasheetmodelcost,
    ],
    daos: [
    FactionDao,
    DatasheetDao,
    AbilityDao,
    DatasheetAbilityDao,
    DatasheetModelDao,
    DetachmentDao,
    EnhancementDao,
    LastUpdateDao,
    SourceDao,
    StratagemDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wh40k_army_builder.sqlite'));
    return NativeDatabase(file);
  });
}
