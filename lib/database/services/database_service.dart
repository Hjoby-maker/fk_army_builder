//import 'package:drift/drift.dart';
//import 'dart:ffi';

import 'package:fk_army_builder/database/daos/index_dao.dart';
import 'package:fk_army_builder/database/database.dart';
import 'package:fk_army_builder/database/daos/faction_dao.dart';
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

  Future<void> initialize() async {
    _database = AppDatabase();
    _factionDao = FactionDao(_database);
    _abilityDao = AbilityDao(_database);
    _datasheetDao = DatasheetDao(_database);
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

    // --- Faction methods ---
  Future<List<Datasheet>> getAllDatasheet() => _datasheetDao.getAllDatasheetModels();

  Future<void> saveDatasheets(List<Datasheet> datasheets) {
    final companions = datasheets.map(ModelToCompanion.fromDatasheet).toList();
    return _datasheetDao.insertAllDatasheets(companions);
  }

  Future dropTableDatasheet() => _datasheetDao.dropAndRecreateTable();

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