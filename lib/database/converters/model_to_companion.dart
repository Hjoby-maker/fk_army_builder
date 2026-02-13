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

static TdatasheetabilityCompanion fromDatasheetAbility(models.DatasheetAbility datasheetAbility) {
   return TdatasheetabilityCompanion (
      datasheetId: Value(datasheetAbility.datasheetId),
      line: Value(datasheetAbility.line),
      abilityId: Value(datasheetAbility.abilityId),
      model: Value(datasheetAbility.model),
      name: Value(datasheetAbility.name),
      description: Value(datasheetAbility.description),
      type: Value(datasheetAbility.type),
      parameter: Value(datasheetAbility.parameter),
    );
 }

 static TdatasheetmodelCompanion fromDatasheetModel(models.DatasheetModel datasheetModel) {
   return TdatasheetmodelCompanion (
      datasheetId: Value(datasheetModel.datasheetId),
      line: Value(datasheetModel.line),
      name: Value(datasheetModel.name),
      move: Value(datasheetModel.move),
      toughness: Value(datasheetModel.toughness),
      save: Value(datasheetModel.save),
      invulnerableSave: Value(datasheetModel.invulnerableSave),
      invulnerableSaveDescription: Value(datasheetModel.invulnerableSaveDescription),
      wounds: Value(datasheetModel.wounds),
      leadership: Value(datasheetModel.leadership),
      objectiveControl: Value(datasheetModel.objectiveControl),
      baseSize: Value(datasheetModel.baseSize),
      baseSizeDescription: Value(datasheetModel.baseSizeDescription),
    );
 }

static TenhancementCompanion fromEnhacement(models.Enhancement enhancement) {
   return TenhancementCompanion (
      factionId: Value(enhancement.factionId),
      id: Value(enhancement.id),
      name: Value(enhancement.name),
      cost: Value(enhancement.cost),
      detachment: Value(enhancement.detachment),
      detachmentId: Value(enhancement.detachmentId),
      legend: Value(enhancement.legend),
      description: Value(enhancement.description),
    );
 }

}