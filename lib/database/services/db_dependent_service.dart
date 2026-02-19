// lib/database/services/base/db_dependent_service.dart
import 'dart:async';
import 'package:drift/drift.dart';
import 'package:meta/meta.dart'; // ✅ ДОБАВЛЕНО: для @mustCallSuper

// ✅ КЛЮЧЕВОЙ ИМПОРТ: все DAO экспортируются из index_dao.dart
import '../daos/index_dao.dart';
import '../database.dart';
import 'database_service.dart';

/// Базовый абстрактный класс для сервисов, зависящих от DatabaseService.
abstract class DbDependentService {
  final DatabaseService _dbService;

  DbDependentService(this._dbService) {
    try {
      _dbService.database;
    } catch (e) {
      throw StateError(
        'DatabaseService должен быть инициализирован перед использованием ${runtimeType}. '
        'Вызовите DatabaseService().initialize() в main().',
      );
    }
  }

  //════════════════════════════════════════════════════════════
  // 🗄️ Доступ к базе данных
  //════════════════════════════════════════════════════════════

  AppDatabase get db => _dbService.database;

  //════════════════════════════════════════════════════════════
  // 📦 DAO геттеры (соответствуют полям в DatabaseService)
  //════════════════════════════════════════════════════════════

  // Основные DAO (из @DriftDatabase annotation)
  FactionDao get factionDao => _dbService.factionDao;
  DatasheetDao get datasheetDao => _dbService.datasheetDao;
  AbilityDao get abilityDao => _dbService.abilityDao;
  DatasheetAbilityDao get datasheetAbilityDao => _dbService.datasheetAbilityDao;
  DatasheetModelDao get datasheetModelDao => _dbService.datasheetModelDao;
  DetachmentDao get detachmentDao => _dbService.detachmentDao;
  EnhancementDao get enhancementDao => _dbService.enhancementDao;
  StratagemDao get stratagemDao => _dbService.stratagemDao;
  SourceDao get sourceDao => _dbService.sourceDao;
  LastUpdateDao get lastUpdateDao => _dbService.lastUpdateDao;

  // Дополнительные DAO (созданы вручную)
  DatasheetWargearDao get datasheetWargearDao => _dbService.datasheetWargearDao;
  DatasheetKeywordDao get datasheetKeywordDao => _dbService.datasheetKeywordDao;
  DatasheetOptionDao get datasheetOptionDao => _dbService.datasheetOptionDao;
  DatasheetLeaderDao get datasheetLeaderDao => _dbService.datasheetLeaderDao;
  DatasheetStratagemDao get datasheetStratagemDao =>
      _dbService.datasheetStratagemDao;
  DatasheetEnhancementDao get datasheetEnhancementDao =>
      _dbService.datasheetEnhancementDao;
  DatasheetDetachmentAbilityDao get datasheetDetachmentAbilityDao =>
      _dbService.datasheetDetachmentAbilityDao;
  DatasheetUnitCompositionDao get datasheetUnitCompositionDao =>
      _dbService.datasheetUnitCompositionDao;
  DatasheetModelCostDao get datasheetModelCostDao =>
      _dbService.datasheetModelCostDao;
  DetachmentAbilityDao get detachmentAbilityDao =>
      _dbService.detachmentAbilityDao;

  //════════════════════════════════════════════════════════════
  // 🛠️ Утилиты для запросов
  //════════════════════════════════════════════════════════════

  Future<T> executeQuery<T>(
    String description,
    Future<T> Function() query, {
    bool enableLogging = true,
  }) async {
    if (enableLogging) print('🔍 [DB] $description');
    try {
      final result = await query();
      if (enableLogging) print('✅ [DB OK] $description');
      return result;
    } catch (e, stack) {
      if (enableLogging) {
        print('❌ [DB ERR] $description: $e');
        print(stack);
      }
      rethrow;
    }
  }

  Future<T> executeTransaction<T>(
    String description,
    Future<T> Function() transaction, {
    bool enableLogging = true,
  }) async {
    if (enableLogging) print('🔄 [TX] $description');
    try {
      final result = await db.transaction(() async => await transaction());
      if (enableLogging) print('✅ [TX OK] $description');
      return result;
    } catch (e, stack) {
      if (enableLogging) {
        print('❌ [TX ERR] $description: $e');
        print(stack);
      }
      rethrow;
    }
  }

  T? firstOrNull<T>(List<T> list) => list.isEmpty ? null : list.first;

  Expression<bool> buildKeywordFilter(
    GeneratedColumn<String> column,
    List<String> keywords, {
    bool caseSensitive = false,
  }) {
    if (keywords.isEmpty) return const Constant(true);
    return caseSensitive
        ? column.isIn(keywords)
        : column.lower().isIn(keywords.map((k) => k.toLowerCase()).toList());
  }

  Expression<bool> buildRangeFilter<T extends num>(
    GeneratedColumn<T> column, {
    T? min,
    T? max,
  }) {
    Expression<bool> condition = const Constant(true);
    if (min != null) condition = condition & column.isBiggerOrEqualValue(min);
    if (max != null) condition = condition & column.isSmallerOrEqualValue(max);
    return condition;
  }

  @mustCallSuper
  Future<void> onInit() async {}

  @mustCallSuper
  Future<void> onDispose() async {}
}
