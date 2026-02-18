// app_state.dart
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:fk_army_builder/database/services/database_service.dart';

class AppState extends ChangeNotifier {
  // Singleton
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  final DatabaseService _db = DatabaseService();
  bool _isInitialized = false;
  String? _initError;

// Поля для текущей создаваемой армии
  String? _currentArmyName;
  String? _currentFactionType;
  String? _currentFaction;
  int? _currentMaxPoints;

  // Геттеры для полей армии
  String? get currentArmyName => _currentArmyName;
  String? get currentFactionType => _currentFactionType;
  String? get currentFaction => _currentFaction;
  int? get currentMaxPoints => _currentMaxPoints;

// Геттер для DatabaseService
  DatabaseService get databaseService => _db;
// Геттер для статуса инициализации
  bool get initialized => _isInitialized;
  String? get initError => _initError;
// Инициализация при запуске

  Future<void> initialize() async {
    if (_isInitialized) {
      print('AppState уже инициализирован');
      return;
    }

    try {
      print('Начало инициализации AppState...');

      // Инициализируем DatabaseService
      await _db.initialize();

      _isInitialized = true;
      _initError = null;

      print('AppState успешно инициализирован');
      notifyListeners();
    } catch (e, stack) {
      _initError = e.toString();
      print('Ошибка инициализации AppState: $e');
      print(stack);
      // Не пробрасываем исключение дальше, чтобы приложение запустилось
      // но покажем ошибку пользователю
    }
  }

  /* Future<void> initialize() async {
    if (!_isInitialized) {
      await _db.initialize();
      _isInitialized = true;
      notifyListeners();
      print('Database initialize');
    }
  }*/

  // Метод для установки параметров новой армии
  void setNewArmyParams({
    required String armyName,
    required String factionType,
    required String faction,
    required int maxPoints,
  }) {
    _currentArmyName = armyName;
    _currentFactionType = factionType;
    _currentFaction = faction;
    _currentMaxPoints = maxPoints;
    notifyListeners();
    print('Параметры армии сохранены: $armyName, $faction, $maxPoints');
  }

  // Метод для сброса параметров армии (после использования или при отмене)
  void clearArmyParams() {
    _currentArmyName = null;
    _currentFactionType = null;
    _currentFaction = null;
    _currentMaxPoints = null;
    notifyListeners();
    print('Параметры армии сброшены');
  }

  // Состояние приложения
  DateTime? _lastDataUpdate;
  String _currentLanguage = 'ru';
  ThemeMode _themeMode = ThemeMode.dark;
  int _maxArmyPoints = maxPointsDefault;
  final Map<String, dynamic> _userPreferences = {};

  // Состояние загрузки данных
  final Map<String, bool> _fileDownloadStatus = {};
  final Map<String, int> _fileDownloadProgress = {};
  bool _isDownloading = false;
  final int _totalFilesToDownload = csvFiles.length;
  int _filesDownloaded = 0;

  // Геттеры
  DateTime? get lastDataUpdate => _lastDataUpdate;
  String get currentLanguage => _currentLanguage;
  ThemeMode get themeMode => _themeMode;
  int get maxArmyPoints => _maxArmyPoints;
  bool get isDownloading => _isDownloading;
  int get totalFilesToDownload => _totalFilesToDownload;
  int get filesDownloaded => _filesDownloaded;
  double get downloadProgress =>
      _totalFilesToDownload > 0 ? _filesDownloaded / _totalFilesToDownload : 0;

  // Проверить статус конкретного файла
  bool isFileDownloaded(String fileName) =>
      _fileDownloadStatus[fileName] ?? false;

  // Получить прогресс загрузки файла (0-100)
  int getFileProgress(String fileName) => _fileDownloadProgress[fileName] ?? 0;

  // Сеттеры
  set lastDataUpdate(DateTime? date) {
    _lastDataUpdate = date;
    notifyListeners();
  }

  set currentLanguage(String lang) {
    _currentLanguage = lang;
    notifyListeners();
  }

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  set maxArmyPoints(int points) {
    _maxArmyPoints = points;
    notifyListeners();
  }

  // Методы для управления состоянием загрузки

  void startDownload() {
    _isDownloading = true;
    _filesDownloaded = 0;
    _fileDownloadProgress.clear();
    notifyListeners();
  }

  void updateFileProgress(String fileName, int progress) {
    _fileDownloadProgress[fileName] = progress;
    notifyListeners();
  }

  void markFileAsDownloaded(String fileName, bool success) {
    _fileDownloadStatus[fileName] = success;
    _filesDownloaded++;
    notifyListeners();
  }

  void finishDownload() {
    _isDownloading = false;
    notifyListeners();
  }

  void resetDownloadStatus() {
    _fileDownloadStatus.clear();
    _fileDownloadProgress.clear();
    _filesDownloaded = 0;
    _isDownloading = false;
    notifyListeners();
  }

  // Проверить, все ли файлы загружены
  bool get allFilesDownloaded {
    if (_fileDownloadStatus.length < csvFiles.length) return false;
    return _fileDownloadStatus.values.every((status) => status == true);
  }

  // Получить список не загруженных файлов
  List<String> get missingFiles {
    return csvFiles
        .where((file) => !(_fileDownloadStatus[file] ?? false))
        .toList();
  }

  // Методы
  void updatePreference(String key, dynamic value) {
    _userPreferences[key] = value;
    notifyListeners();
  }

  dynamic getPreference(String key) {
    return _userPreferences[key];
  }

  void resetToDefaults() {
    _currentLanguage = 'ru';
    _themeMode = ThemeMode.dark;
    _maxArmyPoints = maxPointsDefault;
    _userPreferences.clear();
    resetDownloadStatus();
    notifyListeners();
  }
}
