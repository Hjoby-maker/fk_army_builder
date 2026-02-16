//import 'package:drift/drift.dart';
//import 'dart:ffi';

import 'package:fk_army_builder/database/daos/index_dao.dart';
import 'package:fk_army_builder/database/database.dart';
import 'package:fk_army_builder/database/converters/model_to_companion.dart';
import 'package:fk_army_builder/models/index.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  late AppDatabase _database;
  late FactionDao _factionDao;
  late AbilityDao _abilityDao;
  late DatasheetDao _datasheetDao;
  late DatasheetAbilityDao _datasheetAbilityDao;
  late DatasheetModelDao _datasheetModelDao;
  late EnhancementDao _enhancementDao;
  late DetachmentDao _detachmentDao;
  late StratagemDao _stratagemDao;
  late SourceDao _sourceDao;
  late LastUpdateDao _lastUpdateDao;
  late DatasheetWargearDao _datasheetWargearDao;
  late DatasheetKeywordDao _datasheetKeywordDao;
  late DatasheetOptionDao _datasheetOptionDao;
  late DatasheetLeaderDao _datasheetLeaderDao;
  late DatasheetStratagemDao _datasheetStratagemDao;
  late DatasheetEnhancementDao _datasheetEnhancementDao;
  late DatasheetDetachmentAbilityDao _datasheetDetachmentAbilityDao;
  late DatasheetUnitCompositionDao _datasheetUnitCompositionDao;
  late DatasheetModelCostDao _datasheetModelCostDao;
  late DetachmentAbilityDao _detachmentAbilityDao;

  Future<void> initialize() async {
    _database = AppDatabase();
    _factionDao = FactionDao(_database);
    _abilityDao = AbilityDao(_database);
    _datasheetDao = DatasheetDao(_database);
    _datasheetAbilityDao = DatasheetAbilityDao(_database);
    _datasheetModelDao = DatasheetModelDao(_database);
    _enhancementDao = EnhancementDao(_database);
    _detachmentDao = DetachmentDao(_database);
    _stratagemDao = StratagemDao(_database);
    _sourceDao = SourceDao(_database);
    _lastUpdateDao = LastUpdateDao(_database);
    _datasheetWargearDao = DatasheetWargearDao(_database);
    _datasheetKeywordDao = DatasheetKeywordDao(_database);
    _datasheetOptionDao = DatasheetOptionDao(_database);
    _datasheetLeaderDao = DatasheetLeaderDao(_database);
    _datasheetStratagemDao = DatasheetStratagemDao(_database);
    _datasheetEnhancementDao = DatasheetEnhancementDao(_database);
    _datasheetDetachmentAbilityDao = DatasheetDetachmentAbilityDao(_database);
    _datasheetUnitCompositionDao = DatasheetUnitCompositionDao(_database);
    _datasheetModelCostDao = DatasheetModelCostDao(_database);
    _detachmentAbilityDao = DetachmentAbilityDao(_database);
  }

  // ===========================Faction methods================================
  Future<List<Faction>> getAllFactions() => _factionDao.getAllFactionModels();

  Future<void> saveFactions(List<Faction> factions) {
    final companions = factions.map(ModelToCompanion.fromFaction).toList();
    return _factionDao.insertAllFactions(companions);
  }

  Future debugLenTfaction() => _factionDao.debugLenTfaction();
  //===========================================================================

  // ===========================Ability methods================================
  Future<List<Ability>> getAllAbility() => _abilityDao.getAllAbilityModels();

  Future<void> saveAbility(List<Ability> ability) {
    final companions = ability.map(ModelToCompanion.fromAbitity).toList();
    return _abilityDao.insertAllAbilities(companions);
  }

  Future debugLenTability() => _abilityDao.debugLenTability();
  //===========================================================================

  // ===========================Datasheet methods==============================
  Future<List<Datasheet>> getAllDatasheet() =>
      _datasheetDao.getAllDatasheetModels();

  Future<void> saveDatasheets(List<Datasheet> datasheets) {
    final companions = datasheets.map(ModelToCompanion.fromDatasheet).toList();
    return _datasheetDao.insertAllDatasheets(companions);
  }

  Future debugLenTdatasheet() => _datasheetDao.debugLenTdatasheet();
  //===========================================================================

  // ===========================DatasheetAbility methods=======================
  Future<List<DatasheetAbility>> getAllDatasheetAbility() =>
      _datasheetAbilityDao.getAllDatasheetAbilityModels();

  Future<void> saveDatasheetsAbility(
      List<DatasheetAbility> datasheetAbilities) {
    final companions =
        datasheetAbilities.map(ModelToCompanion.fromDatasheetAbility).toList();
    return _datasheetAbilityDao.insertAll(companions);
  }

  Future debugLenTdatasheetAbility() =>
      _datasheetAbilityDao.debugLenTdatasheetAbility();
  //===========================================================================

  // ===========================DatasheetModel methods=========================
  Future<List<DatasheetModel>> getAllDatasheetModel() =>
      _datasheetModelDao.getAllDatasheetModels();

  Future<void> saveDatasheetsModel(List<DatasheetModel> datasheetsModels) {
    final companions =
        datasheetsModels.map(ModelToCompanion.fromDatasheetModel).toList();
    return _datasheetModelDao.insertAll(companions);
  }

  Future debugLenTdatasheetModel() =>
      _datasheetModelDao.debugLenTdatasheetModel();
  //===========================================================================

  // ===========================Enhancement methods============================
  Future<List<Enhancement>> getAllEnhacment() =>
      _enhancementDao.getAllEnhancementModels();

  Future<void> saveEnhancement(List<Enhancement> enhancement) {
    final companions =
        enhancement.map(ModelToCompanion.fromEnhacement).toList();
    return _enhancementDao.insertAllEnhancements(companions);
  }

  Future debugLenTenhancement() => _enhancementDao.debugLenTenhancement();
  //===========================================================================

  // ===========================Detachment methods============================
  Future<List<Detachment>> getAllDetachment() =>
      _detachmentDao.getAllDetachmentModels();

  Future<void> saveDetachment(List<Detachment> detachment) {
    final companions = detachment.map(ModelToCompanion.fromDetachment).toList();
    return _detachmentDao.insertAllDetachments(companions);
  }

  Future debugLenTdetachment() => _detachmentDao.debugLenTdetachment();
  //===========================================================================

  // ===========================Stratagem methods==============================
  Future<List<Stratagem>> getAllStratagem() =>
      _stratagemDao.getAllStratagemModels();

  Future<void> saveStratagem(List<Stratagem> stratagem) {
    final companions = stratagem.map(ModelToCompanion.fromStratagem).toList();
    return _stratagemDao.insertAllStratagems(companions);
  }

  Future debugLenTstratagem() => _stratagemDao.debugLenTstratagem();
  //===========================================================================

  // ===========================Source methods============================
  Future<List<Source>> getAllSource() => _sourceDao.getAllSourceModels();

  Future<void> saveSource(List<Source> source) {
    final companions = source.map(ModelToCompanion.fromSource).toList();
    return _sourceDao.insertAllSources(companions);
  }

  Future debugLenTsource() => _sourceDao.debugLenTsource();
  //===========================================================================

  // ===========================DatasheetDetachmentAbility methods=============
  Future<List<DatasheetDetachmentAbility>>
      getAllDatasheetDetachmentAbilityModels() =>
          _datasheetDetachmentAbilityDao.getAllModels();

  Future<void> saveDatasheetDetachmentAbility(
      List<DatasheetDetachmentAbility> datasheetDetachmentAbility) {
    final companions = datasheetDetachmentAbility
        .map(ModelToCompanion.fromDatasheetDetachmentAbility)
        .toList();
    return _datasheetDetachmentAbilityDao.insertAll(companions);
  }

  Future debugLedebugLenTdatasheetDetachmentAbilitynTsource() =>
      _datasheetDetachmentAbilityDao.debugLenTdatasheetDetachmentAbility();
  //===========================================================================

  // ===========================DatasheetEnhancement methods===================
  Future<List<DatasheetEnhancement>> getAllDatasheetEnhancementModels() =>
      _datasheetEnhancementDao.getAllModels();

  Future<void> saveDatasheetEnhancement(
      List<DatasheetEnhancement> datasheetEnhancement) {
    final companions = datasheetEnhancement
        .map(ModelToCompanion.fromDatasheetEnhancement)
        .toList();
    return _datasheetEnhancementDao.insertAll(companions);
  }

  Future debugLenTdatasheetEnhancement() =>
      _datasheetEnhancementDao.debugLenTdatasheetEnhancement();
  //===========================================================================

  // Очистка БД при перезагрузке данных
  Future<void> clearAllData() async {
    await _database.transaction(() async {
      // Удаляем в правильном порядке (с учетом внешних ключей)

      await _database.delete(_database.tenhancement).go();
      await _database.delete(_database.tdatasheetmodel).go();
      await _database.delete(_database.tdatasheetability).go();
      await _database.delete(_database.tdatasheet).go();
      await _database.delete(_database.tability).go();
      await _database.delete(_database.tfaction).go();
    });
    print('Данные удалены');
  }

  Future<void> close() async {
    await _database.close();
  }
}
