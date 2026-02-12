import 'package:drift/drift.dart';
import '../../models/index.dart' as models;
import 'package:fk_army_builder/database/database.dart';
// ... остальные импорты

class ModelToCompanion {
 static TfactionCompanion fromFaction(models.Faction faction) {
   return TfactionCompanion (
      id: Value(faction.id),
      name: Value(faction.name),
      link: Value(faction.link),
    );
 }


}