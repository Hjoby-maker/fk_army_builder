//import 'package:drift/drift.dart';
//import 'dart:ffi';

import 'package:fk_army_builder/database/daos/datasheet_ability_dao.dart';
import 'package:fk_army_builder/database/daos/datasheet_model_dao.dart';
import 'package:fk_army_builder/database/daos/enhancement_dao.dart';
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

  Future<void> initialize() async {
    _database = AppDatabase();
    _factionDao = FactionDao(_database);
    _abilityDao = AbilityDao(_database);
    _datasheetDao = DatasheetDao(_database);
    _datasheetAbilityDao = DatasheetAbilityDao(_database);
    _datasheetModelDao = DatasheetModelDao(_database);
    _enhancementDao = EnhancementDao(_database);
  }

  // --- Faction methods ---
  Future<List<Faction>> getAllFactions() => _factionDao.getAllFactionModels();

  Future<void> saveFactions(List<Faction> factions) {
    final companions = factions.map(ModelToCompanion.fromFaction).toList();
    return _factionDao.insertAllFactions(companions);
  }

  Future dropTableFactions() => _factionDao.dropAndRecreateTable();

    // --- Ability methods ---
  Future<List<Ability>> getAllAbility() => _abilityDao.getAllAbilityModels();

  Future<void> saveAbility(List<Ability> ability) {
    final companions = ability.map(ModelToCompanion.fromAbitity).toList();
    return _abilityDao.insertAllAbilities(companions);
  }

  Future dropTableAbility() => _abilityDao.dropAndRecreateTable();

  Future debugPrintTability() => _abilityDao.debugPrintTabilitySchema();

    // --- Datasheet methods ---
  Future<List<Datasheet>> getAllDatasheet() => _datasheetDao.getAllDatasheetModels();

  Future<void> saveDatasheets(List<Datasheet> datasheets) {
    final companions = datasheets.map(ModelToCompanion.fromDatasheet).toList();
    return _datasheetDao.insertAllDatasheets(companions);
  }

  Future dropTableDatasheet() => _datasheetDao.dropAndRecreateTable();

    // --- DatasheetAbility methods ---
  Future<List<DatasheetAbility>> getAllDatasheetAbility() => _datasheetAbilityDao.getAllDatasheetAbilityModels();

  Future<void> saveDatasheetsAbility(List<DatasheetAbility> datasheetAbilities) {
    final companions = datasheetAbilities.map(ModelToCompanion.fromDatasheetAbility).toList();
    return _datasheetAbilityDao.insertAll(companions);
  }

      // --- DatasheetModel methods ---
  Future<List<DatasheetModel>> getAllDatasheetModel() => _datasheetModelDao.getAllDatasheetModels();

  Future<void> saveDatasheetsModel(List<DatasheetModel> datasheetsModels) {
    final companions = datasheetsModels.map(ModelToCompanion.fromDatasheetModel).toList();
    return _datasheetModelDao.insertAll(companions);
  }

// --- DatasheetModel methods ---
  Future<List<Enhancement>> getAllEnhacment() => _enhancementDao.getAllEnhancementModels();

  Future<void> saveEnhancement(List<Enhancement> enhancement) {
    final companions = enhancement.map(ModelToCompanion.fromEnhacement).toList();
    return _enhancementDao.insertAllEnhancements(companions);
  }

  // Очистка БД при перезагрузке данных
  Future<void> clearAllData() async {
    await _database.transaction(() async {
      // Удаляем в правильном порядке (с учетом внешних ключей)
//      await _database.delete(_database.datasheetWargear).go();
//      await _database.delete(_database.datasheetModels).go();
//      await _database.delete(_database.datasheetAbilities).go();
      // ... остальные таблицы
//      await _database.delete(_database.datasheets).go();
      await _database.delete(_database.tfaction).go();
    });
    print('Данные удалены');
  }

  Future<void> close() async {
    await _database.close();
  }

}