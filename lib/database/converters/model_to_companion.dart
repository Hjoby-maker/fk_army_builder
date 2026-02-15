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

static TdatasheetmodelcostCompanion fromDatasheetModelCost(models.DatasheetModelCost datasheetModelCost) {
   return TdatasheetmodelcostCompanion (
      datasheetId: Value(datasheetModelCost.datasheetId),
      line: Value(datasheetModelCost.line),
      description: Value(datasheetModelCost.description),
      cost: Value(datasheetModelCost.cost),
    );
 }

static TdatasheetoptionCompanion fromDatasheetOption(models.DatasheetOption datasheetOption) {
   return TdatasheetoptionCompanion (
      datasheetId: Value(datasheetOption.datasheetId),
      line: Value(datasheetOption.line),
      button: Value(datasheetOption.button),
      description: Value(datasheetOption.description),
    );
 }

static TdatasheetunitcompositionCompanion fromDatasheetUnitComposition(models.DatasheetUnitComposition unitComposition) {
   return TdatasheetunitcompositionCompanion (
      datasheetId: Value(unitComposition.datasheetId),
      line: Value(unitComposition.line),
      description: Value(unitComposition.description),
    );
 }

static TdatasheetwargearCompanion fromDatasheetWargear(models.DatasheetWargear datasheetWargear) {
   return TdatasheetwargearCompanion (
      datasheetId: Value(datasheetWargear.datasheetId),
      line: Value(datasheetWargear.line),
      lineInWargear: Value(datasheetWargear.lineInWargear),
      dice: Value(datasheetWargear.dice),
      name: Value(datasheetWargear.name),
      description: Value(datasheetWargear.description),
      range: Value(datasheetWargear.range),
      type: Value(datasheetWargear.type),
      attacks: Value(datasheetWargear.attacks),
      ballisticSkill: Value(datasheetWargear.ballisticSkill),
      strength: Value(datasheetWargear.strength),
      armorPenetration: Value(datasheetWargear.armorPenetration),
      damage: Value(datasheetWargear.damage),
    );
 }

 static TdatasheetkeywordCompanion fromDatasheetKeyword(models.DatasheetKeyword datasheetKeyword) {
   return TdatasheetkeywordCompanion (
      datasheetId: Value(datasheetKeyword.datasheetId),
      keyword: Value(datasheetKeyword.keyword),
      model: Value(datasheetKeyword.model),
      isFactionKeyword: Value(datasheetKeyword.isFactionKeyword),
    );
 }

 static TdatasheetleaderCompanion fromDatasheetLeader(models.DatasheetLeader datasheetLeader) {
   return TdatasheetleaderCompanion (
      leaderId: Value(datasheetLeader.leaderId),
      attachedId: Value(datasheetLeader.attachedId),
    );
 }

 static TdetachmentCompanion fromDetachment(models.Detachment detachment) {
   return TdetachmentCompanion (
      id: Value(detachment.id),
      factionId: Value(detachment.factionId),
      name: Value(detachment.name),
      legend: Value(detachment.legend),
      type: Value(detachment.type),
    );
 }

static TdetachmentabilityCompanion fromDetachmentAbility(models.DetachmentAbility detachmentAbility) {
   return TdetachmentabilityCompanion (
      id: Value(detachmentAbility.id),
      factionId: Value(detachmentAbility.factionId),
      name: Value(detachmentAbility.name),
      legend: Value(detachmentAbility.legend),
      description: Value(detachmentAbility.description),
      detachment: Value(detachmentAbility.detachment),
      detachmentId: Value(detachmentAbility.detachmentId),
    );
 }
 
static TdatasheetdetachmentabilityCompanion fromDatasheetDetachmentAbility(models.DatasheetDetachmentAbility datasheetDetachmentAbility) {
   return TdatasheetdetachmentabilityCompanion (
      datasheetId: Value(datasheetDetachmentAbility.datasheetId),
      detachmentAbilityId: Value(datasheetDetachmentAbility.detachmentAbilityId),
    );
 }

 static TdatasheetenhancementCompanion fromDatasheetEnhancement(models.DatasheetEnhancement datasheetEnhancement) {
   return TdatasheetenhancementCompanion (
      datasheetId: Value(datasheetEnhancement.datasheetId),
      enhancementId: Value(datasheetEnhancement.enhancementId),
    );
 }

 static TstratagemCompanion fromStratagem(models.Stratagem stratagem) {
   return TstratagemCompanion (
      factionId: Value(stratagem.factionId),
      name: Value(stratagem.name),
      id: Value(stratagem.id),
      type: Value(stratagem.type),
      commandPointCost: Value(stratagem.commandPointCost),
      legend: Value(stratagem.legend),
      turn: Value(stratagem.turn),
      phase: Value(stratagem.phase),
      detachment: Value(stratagem.detachment),
      detachmentId: Value(stratagem.detachmentId),
      description: Value(stratagem.description),
    );
 }

 static TdatasheetstratagemCompanion fromDatasheetStratagem(models.DatasheetStratagem datasheetStratagem) {
   return TdatasheetstratagemCompanion (
      datasheetId: Value(datasheetStratagem.datasheetId),
      stratagemId: Value(datasheetStratagem.stratagemId),
    );
 }

 static TsourceCompanion fromSource(models.Source source) {
   return TsourceCompanion (
      id: Value(source.id),
      name: Value(source.name),
      type: Value(source.type),
      edition: Value(source.edition),
      version: Value(source.version),
      errataDate: Value(source.errataDate),
      errataLink: Value(source.errataLink),
    );
 }

 static TlastupdateCompanion fromLastUpdate(models.LastUpdate lastUpdate) {
   return TlastupdateCompanion (
      lastUpdate: Value(lastUpdate.lastUpdate),
    );
 }
}

