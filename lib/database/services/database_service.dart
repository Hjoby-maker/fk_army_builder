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

  late AppDatabase? _database;
  late FactionDao? _factionDao;
  late AbilityDao? _abilityDao;
  late DatasheetDao? _datasheetDao;
  late DatasheetAbilityDao? _datasheetAbilityDao;
  late DatasheetModelDao? _datasheetModelDao;
  late EnhancementDao? _enhancementDao;
  late DetachmentDao? _detachmentDao;
  late StratagemDao? _stratagemDao;
  late SourceDao? _sourceDao;
  late LastUpdateDao? _lastUpdateDao;
  late DatasheetWargearDao? _datasheetWargearDao;
  late DatasheetKeywordDao? _datasheetKeywordDao;
  late DatasheetOptionDao? _datasheetOptionDao;
  late DatasheetLeaderDao? _datasheetLeaderDao;
  late DatasheetStratagemDao? _datasheetStratagemDao;
  late DatasheetEnhancementDao? _datasheetEnhancementDao;
  late DatasheetDetachmentAbilityDao? _datasheetDetachmentAbilityDao;
  late DatasheetUnitCompositionDao? _datasheetUnitCompositionDao;
  late DatasheetModelCostDao? _datasheetModelCostDao;
  late DetachmentAbilityDao? _detachmentAbilityDao;

  bool _isInitialized = false;

  AppDatabase get database {
    _checkInitialized();
    return _database!;
  }

  FactionDao get factionDao {
    _checkInitialized();
    return _factionDao!;
  }

  AbilityDao get abilityDao {
    _checkInitialized();
    return _abilityDao!;
  }

  DatasheetDao get datasheetDao {
    _checkInitialized();
    return _datasheetDao!;
  }

  DatasheetAbilityDao get datasheetAbilityDao {
    _checkInitialized();
    return _datasheetAbilityDao!;
  }

  DatasheetModelDao get datasheetModelDao {
    _checkInitialized();
    return _datasheetModelDao!;
  }

  EnhancementDao get enhancementDao {
    _checkInitialized();
    return _enhancementDao!;
  }

  DetachmentDao get detachmentDao {
    _checkInitialized();
    return _detachmentDao!;
  }

  StratagemDao get stratagemDao {
    _checkInitialized();
    return _stratagemDao!;
  }

  SourceDao get sourceDao {
    _checkInitialized();
    return _sourceDao!;
  }

  LastUpdateDao get lastUpdateDao {
    _checkInitialized();
    return _lastUpdateDao!;
  }

  DatasheetWargearDao get datasheetWargearDao {
    _checkInitialized();
    return _datasheetWargearDao!;
  }

  DatasheetKeywordDao get datasheetKeywordDao {
    _checkInitialized();
    return _datasheetKeywordDao!;
  }

  DatasheetOptionDao get datasheetOptionDao {
    _checkInitialized();
    return _datasheetOptionDao!;
  }

  DatasheetLeaderDao get datasheetLeaderDao {
    _checkInitialized();
    return _datasheetLeaderDao!;
  }

  DatasheetStratagemDao get datasheetStratagemDao {
    _checkInitialized();
    return _datasheetStratagemDao!;
  }

  DatasheetEnhancementDao get datasheetEnhancementDao {
    _checkInitialized();
    return _datasheetEnhancementDao!;
  }

  DatasheetDetachmentAbilityDao get datasheetDetachmentAbilityDao {
    _checkInitialized();
    return _datasheetDetachmentAbilityDao!;
  }

  DatasheetUnitCompositionDao get datasheetUnitCompositionDao {
    _checkInitialized();
    return _datasheetUnitCompositionDao!;
  }

  DatasheetModelCostDao get datasheetModelCostDao {
    _checkInitialized();
    return _datasheetModelCostDao!;
  }

  DetachmentAbilityDao get detachmentAbilityDao {
    _checkInitialized();
    return _detachmentAbilityDao!;
  }

  Future<void> initialize() async {
    if (_isInitialized) {
      print('DatabaseService уже инициализирован');
      return;
    }
    try {
      _database = AppDatabase();
      _factionDao = FactionDao(_database!);
      _abilityDao = AbilityDao(_database!);
      _datasheetDao = DatasheetDao(_database!);
      _datasheetAbilityDao = DatasheetAbilityDao(_database!);
      _datasheetModelDao = DatasheetModelDao(_database!);
      _enhancementDao = EnhancementDao(_database!);
      _detachmentDao = DetachmentDao(_database!);
      _stratagemDao = StratagemDao(_database!);
      _sourceDao = SourceDao(_database!);
      _lastUpdateDao = LastUpdateDao(_database!);
      _datasheetWargearDao = DatasheetWargearDao(_database!);
      _datasheetKeywordDao = DatasheetKeywordDao(_database!);
      _datasheetOptionDao = DatasheetOptionDao(_database!);
      _datasheetLeaderDao = DatasheetLeaderDao(_database!);
      _datasheetStratagemDao = DatasheetStratagemDao(_database!);
      _datasheetEnhancementDao = DatasheetEnhancementDao(_database!);
      _datasheetDetachmentAbilityDao =
          DatasheetDetachmentAbilityDao(_database!);
      _datasheetUnitCompositionDao = DatasheetUnitCompositionDao(_database!);
      _datasheetModelCostDao = DatasheetModelCostDao(_database!);
      _detachmentAbilityDao = DetachmentAbilityDao(_database!);
      _isInitialized = true;
      print('DatabaseService успешно инициализирован');
    } catch (e, stack) {
      print('Ошибка инициализации DatabaseService: $e');
      print(stack);
      rethrow; // Пробрасываем дальше для обработки в main
    }
  }

  void _checkInitialized() {
    if (!_isInitialized) {
      throw StateError('DatabaseService не инициализирован. '
          'Вызовите DatabaseService.initialize() в main() до runApp()');
    }
  }

  // ===========================Faction methods================================
  Future<List<Faction>> getAllFactions() => factionDao.getAllFactionModels();

  Future<void> saveFactions(List<Faction> factions) {
    final companions = factions.map(ModelToCompanion.fromFaction).toList();
    return factionDao.insertAllFactions(companions);
  }

  Future debugLenTfaction() => factionDao.debugLenTfaction();
  //===========================================================================

  // ===========================Ability methods================================
  Future<List<Ability>> getAllAbility() => abilityDao.getAllAbilityModels();

  Future<void> saveAbility(List<Ability> ability) {
    final companions = ability.map(ModelToCompanion.fromAbitity).toList();
    return abilityDao.insertAllAbilities(companions);
  }

  Future debugLenTability() => abilityDao.debugLenTability();
  //===========================================================================

  // ===========================Datasheet methods==============================
  Future<List<Datasheet>> getAllDatasheet() =>
      datasheetDao.getAllDatasheetModels();

  Future<void> saveDatasheets(List<Datasheet> datasheets) {
    final companions = datasheets.map(ModelToCompanion.fromDatasheet).toList();
    return datasheetDao.insertAllDatasheets(companions);
  }

  Future debugLenTdatasheet() => datasheetDao.debugLenTdatasheet();
  //===========================================================================

  // ===========================DatasheetAbility methods=======================
  Future<List<DatasheetAbility>> getAllDatasheetAbility() =>
      datasheetAbilityDao.getAllDatasheetAbilityModels();

  Future<void> saveDatasheetsAbility(
      List<DatasheetAbility> datasheetAbilities) {
    final companions =
        datasheetAbilities.map(ModelToCompanion.fromDatasheetAbility).toList();
    return datasheetAbilityDao.insertAll(companions);
  }

  Future debugLenTdatasheetAbility() =>
      datasheetAbilityDao.debugLenTdatasheetAbility();
  //===========================================================================

  // ===========================DatasheetModel methods=========================
  Future<List<DatasheetModel>> getAllDatasheetModel() =>
      datasheetModelDao.getAllDatasheetModels();

  Future<void> saveDatasheetsModel(List<DatasheetModel> datasheetsModels) {
    final companions =
        datasheetsModels.map(ModelToCompanion.fromDatasheetModel).toList();
    return datasheetModelDao.insertAll(companions);
  }

  Future debugLenTdatasheetModel() =>
      datasheetModelDao.debugLenTdatasheetModel();
  //===========================================================================

  // ===========================Enhancement methods============================
  Future<List<Enhancement>> getAllEnhacment() =>
      enhancementDao.getAllEnhancementModels();

  Future<void> saveEnhancement(List<Enhancement> enhancement) {
    final companions =
        enhancement.map(ModelToCompanion.fromEnhacement).toList();
    return enhancementDao.insertAllEnhancements(companions);
  }

  Future debugLenTenhancement() => enhancementDao.debugLenTenhancement();
  //===========================================================================

  // ===========================Detachment methods============================
  Future<List<Detachment>> getAllDetachment() =>
      detachmentDao.getAllDetachmentModels();

  Future<void> saveDetachment(List<Detachment> detachment) {
    final companions = detachment.map(ModelToCompanion.fromDetachment).toList();
    return detachmentDao.insertAllDetachments(companions);
  }

  Future debugLenTdetachment() => detachmentDao.debugLenTdetachment();
  //===========================================================================

  // ===========================Stratagem methods==============================
  Future<List<Stratagem>> getAllStratagem() =>
      stratagemDao.getAllStratagemModels();

  Future<void> saveStratagem(List<Stratagem> stratagem) {
    final companions = stratagem.map(ModelToCompanion.fromStratagem).toList();
    return stratagemDao.insertAllStratagems(companions);
  }

  Future debugLenTstratagem() => stratagemDao.debugLenTstratagem();
  //===========================================================================

  // ===========================Source methods============================
  Future<List<Source>> getAllSource() => sourceDao.getAllSourceModels();

  Future<void> saveSource(List<Source> source) {
    final companions = source.map(ModelToCompanion.fromSource).toList();
    return sourceDao.insertAllSources(companions);
  }

  Future debugLenTsource() => sourceDao.debugLenTsource();
  //===========================================================================

  // ===========================DatasheetDetachmentAbility methods=============
  Future<List<DatasheetDetachmentAbility>>
      getAllDatasheetDetachmentAbilityModels() =>
          datasheetDetachmentAbilityDao.getAllModels();

  Future<void> saveDatasheetDetachmentAbility(
      List<DatasheetDetachmentAbility> datasheetDetachmentAbility) {
    final companions = datasheetDetachmentAbility
        .map(ModelToCompanion.fromDatasheetDetachmentAbility)
        .toList();
    return datasheetDetachmentAbilityDao.insertAll(companions);
  }

  Future debugLedebugLenTdatasheetDetachmentAbilitynTsource() =>
      datasheetDetachmentAbilityDao.debugLenTdatasheetDetachmentAbility();
  //===========================================================================

  // ===========================DatasheetEnhancement methods===================
  Future<List<DatasheetEnhancement>> getAllDatasheetEnhancementModels() =>
      datasheetEnhancementDao.getAllModels();

  Future<void> saveDatasheetEnhancement(
      List<DatasheetEnhancement> datasheetEnhancement) {
    final companions = datasheetEnhancement
        .map(ModelToCompanion.fromDatasheetEnhancement)
        .toList();
    return datasheetEnhancementDao.insertAll(companions);
  }

  Future debugLenTdatasheetEnhancement() =>
      datasheetEnhancementDao.debugLenTdatasheetEnhancement();
  //===========================================================================

  // ===========================DatasheetKeyword methods===================
  Future<List<DatasheetKeyword>> getAllDatasheetKeywordModels() =>
      datasheetKeywordDao.getAllKeywordModels();

  Future<void> saveDatasheetKeyword(List<DatasheetKeyword> datasheetKeyword) {
    final companions =
        datasheetKeyword.map(ModelToCompanion.fromDatasheetKeyword).toList();
    return datasheetKeywordDao.insertAllKeywords(companions);
  }

  Future debugLenTdatasheetKeyword() =>
      datasheetKeywordDao.debugLenTdatasheetKeyword();
  //===========================================================================

  // ===========================DatasheetLeader methods===================
  Future<List<DatasheetLeader>> getAllDatasheetLeaderModels() =>
      datasheetLeaderDao.getAllLeaderModels();

  Future<void> saveDatasheetLeader(List<DatasheetLeader> datasheetLeader) {
    final companions =
        datasheetLeader.map(ModelToCompanion.fromDatasheetLeader).toList();
    return datasheetLeaderDao.insertAllLeaders(companions);
  }

  Future debugLenTdatasheetLeader() =>
      datasheetLeaderDao.debugLenTdatasheetLeader();
  //===========================================================================

  // ===========================DatasheetModelCost methods===================
  Future<List<DatasheetModelCost>> getAllDatasheetModelCostModels() =>
      datasheetModelCostDao.getAllCostModels();

  Future<void> saveDatasheetModelCost(
      List<DatasheetModelCost> datasheetModelCost) {
    final companions = datasheetModelCost
        .map(ModelToCompanion.fromDatasheetModelCost)
        .toList();
    return datasheetModelCostDao.insertAllCosts(companions);
  }

  Future debugLenTdatasheetModelCost() =>
      datasheetModelCostDao.debugLenTdatasheetModelCost();
  //===========================================================================

  // ===========================DatasheetOption methods===================
  Future<List<DatasheetOption>> getAllDatasheetOptionModels() =>
      datasheetOptionDao.getAllOptionModels();

  Future<void> saveDatasheetOption(List<DatasheetOption> datasheetOption) {
    final companions =
        datasheetOption.map(ModelToCompanion.fromDatasheetOption).toList();
    return datasheetOptionDao.insertAllOptions(companions);
  }

  Future debugLenTdatasheetOption() =>
      datasheetOptionDao.debugLenTdatasheetOption();
  //===========================================================================

  // ===========================DatasheetStratagem methods===================
  Future<List<DatasheetStratagem>> getAllDatasheetStratagemModels() =>
      datasheetStratagemDao.getAllModels();

  Future<void> saveDatasheetStratagem(
      List<DatasheetStratagem> datasheetStratagem) {
    final companions = datasheetStratagem
        .map(ModelToCompanion.fromDatasheetStratagem)
        .toList();
    return datasheetStratagemDao.insertAll(companions);
  }

  Future debugLenTdatasheetStratagem() =>
      datasheetStratagemDao.debugLenTdatasheetStratagem();
  //===========================================================================

  // ===========================DatasheetUnitComposition methods===============
  Future<List<DatasheetUnitComposition>>
      getAllDatasheetUnitCompositionModels() =>
          datasheetUnitCompositionDao.getAllModels();

  Future<void> saveDatasheetUnitComposition(
      List<DatasheetUnitComposition> datasheetUnitComposition) {
    final companions = datasheetUnitComposition
        .map(ModelToCompanion.fromDatasheetUnitComposition)
        .toList();
    return datasheetUnitCompositionDao.insertAll(companions);
  }

  Future debugLenTdatasheetUnitComposition() =>
      datasheetUnitCompositionDao.debugLenTdatasheetUnitComposition();
  //===========================================================================

  // ===========================DatasheetWargear methods===============
  Future<List<DatasheetWargear>> getAllDatasheetWargearModels() =>
      datasheetWargearDao.getAllWargearModels();

  Future<void> saveDatasheetWargear(List<DatasheetWargear> datasheetWargear) {
    final companions =
        datasheetWargear.map(ModelToCompanion.fromDatasheetWargear).toList();
    return datasheetWargearDao.insertAllWargear(companions);
  }

  Future debugLenTdatasheetWargear() =>
      datasheetWargearDao.debugLenTdatasheetWargear();
  //===========================================================================

  // ===========================DetachmentAbility methods===============
  Future<List<DetachmentAbility>> getAllDetachmentAbilityModels() =>
      detachmentAbilityDao.getAllDetachmentAbilityModels();

  Future<void> saveDetachmentAbility(
      List<DetachmentAbility> detachmentAbility) {
    final companions =
        detachmentAbility.map(ModelToCompanion.fromDetachmentAbility).toList();
    return detachmentAbilityDao.insertAllDetachmentAbilities(companions);
  }

  Future debugLenTdetachmentAbility() =>
      detachmentAbilityDao.debugLenTdetachmentAbility();
  //===========================================================================

  // ===========================LastUpdate methods=============================
  Future<List<LastUpdate>> getAllLastUpdateModels() =>
      lastUpdateDao.getAllLastUpdateModels();

  Future<void> saveLastUpdate(List<LastUpdate> lastUpdate) {
    final companions = lastUpdate.map(ModelToCompanion.fromLastUpdate).toList();
    return lastUpdateDao.insertAllLastUpdates(companions);
  }

  Future<DateTime?> getLastUpdateDate() => lastUpdateDao.getLastUpdateDate();

  Future debugLenTlastUpdate() => lastUpdateDao.debugLenTlastUpdate();
  //===========================================================================

  // Очистка БД при перезагрузке данных
  Future<void> clearAllData() async {
    await _database!.transaction(() async {
      // Удаляем в правильном порядке (с учетом внешних ключей)
      await database.delete(database.tdatasheetoption).go();
      await database.delete(database.tdatasheetmodelcost).go();
      await database.delete(database.tdatasheetleader).go();
      await database.delete(database.tdatasheetkeyword).go();
      await database.delete(database.tdatasheetenhancement).go();
      await database.delete(database.tdatasheetdetachmentability).go();
      await database.delete(database.tsource).go();
      await database.delete(database.tdatasheetunitcomposition).go();
      await database.delete(database.tdetachment).go();
      await database.delete(database.tdatasheetstratagem).go();
      await database.delete(database.tdatasheetwargear).go();
      await database.delete(database.tdetachmentability).go();
      await database.delete(database.tstratagem).go();
      await database.delete(database.tenhancement).go();
      await database.delete(database.tdatasheetmodel).go();
      await database.delete(database.tdatasheetability).go();
      await database.delete(database.tdatasheet).go();
      await database.delete(database.tability).go();
      await database.delete(database.tfaction).go();
    });
    print('Данные удалены');
  }

  Future<void> close() async {
    await database.close();
  }
}
