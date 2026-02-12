//import 'package:drift/drift.dart';
//import 'dart:ffi';

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

  Future<void> initialize() async {
    _database = AppDatabase();
    _factionDao = FactionDao(_database);
  }

  // --- Faction methods ---
  Future<List<Faction>> getAllFactions() => _factionDao.getAllFactionModels();

  Future<void> saveFactions(List<Faction> factions) {
    final companions = factions.map(ModelToCompanion.fromFaction).toList();
    return _factionDao.insertAllFactions(companions);
  }

  Future dropTableFactions() => _factionDao.dropAndRecreateTable();

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