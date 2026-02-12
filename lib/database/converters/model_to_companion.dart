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

  static TabilityCompanion fromAbitity(models.Ability ability) {
   return TabilityCompanion (
      id: Value(ability.id),
      name: Value(ability.name),
      legend: Value(ability.legend),
      factionId: Value(ability.factionId),
      description: Value(ability.description),
    );
 }

  static TdatasheetCompanion fromDatasheet(models.Datasheet datasheet) {
   return TdatasheetCompanion (
      id: Value(datasheet.id),
      name: Value(datasheet.name),
      factionId: Value(datasheet.factionId),
      sourceId: Value(datasheet.sourceId),
      legend: Value(datasheet.legend),
      role: Value(datasheet.role),
      loadout: Value(datasheet.loadout),
      transport: Value(datasheet.transport),
      virtual: Value(datasheet.virtual),
      leaderHead: Value(datasheet.leaderHead),
      leaderFooter: Value(datasheet.leaderFooter),
      damagedW: Value(datasheet.damagedW),
      damagedDescription: Value(datasheet.damagedDescription),
      link: Value(datasheet.link),
    );
 }


}