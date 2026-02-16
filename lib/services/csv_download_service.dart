// csv_download_service.dart
import 'dart:io';
import 'package:fk_army_builder/models/index.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'csv_parser_service.dart';
import '../globals/constants.dart'; // Импортируем глобальные константы
import '../database/services/database_service.dart';

class CSVDownloadService {
  final CSVParserService _parserService = CSVParserService();

  final DatabaseService _db = DatabaseService();

  // Основная функция для загрузки всех файлов
  Future<Map<String, DownloadResult>> downloadAllCSVFiles({
    Function(String, int)? onFileProgress,
    Function(String, bool)? onFileComplete,
  }) async {
    final Map<String, DownloadResult> results = {};
    final Map<String, dynamic> allParsedData = {};

    await _db.clearAllData();

    for (final fileName in csvFiles) {
      try {
        if (onFileProgress != null) onFileProgress(fileName, 0);

        final result = await _downloadSingleCSV(
          fileName,
          onProgress: (progress) {
            if (onFileProgress != null) onFileProgress(fileName, progress);
          },
        );

        results[fileName] = result;
        /*if (fileName == 'Detachments.csv') {
          print(result.parsedData);
        }*/
        //print(result.parsedData);

        await _saveParsedData(fileName, result.parsedData);

        if (result.success && result.parsedData != null) {
          allParsedData[fileName] = result.parsedData;
        }

        if (onFileComplete != null) onFileComplete(fileName, result.success);
      } catch (e) {
        results[fileName] = DownloadResult(
          success: false,
          error: e.toString(),
          fileName: fileName,
        );

        if (onFileComplete != null) onFileComplete(fileName, false);
      }
    }

    return results;
  }

  // Загрузка одного CSV файла
  Future<DownloadResult> _downloadSingleCSV(
    String fileName, {
    Function(int)? onProgress,
  }) async {
    try {
      if (onProgress != null) onProgress(10);

      final url = '$csvBaseUrl/$fileName';
      final response = await http.get(Uri.parse(url));

      if (onProgress != null) onProgress(30);

      if (response.statusCode != 200) {
        throw DownloadException(
          'Не удалось загрузить файл $url. Код статуса: ${response.statusCode}',
          response.statusCode,
        );
      }

      final bytes = response.bodyBytes;
      if (onProgress != null) onProgress(50);

      final csvString = utf8.decode(bytes);
      if (onProgress != null) onProgress(70);

      // Парсинг данных в зависимости от типа файла
      dynamic parsedData = _parseCSVData(fileName, csvString);

      if (onProgress != null) onProgress(80);

      // Получение директории для сохранения
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');

      // Сохранение файла
      await file.writeAsBytes(response.bodyBytes);

      if (onProgress != null) onProgress(100);

      return DownloadResult(
        success: true,
        filePath: file.path,
        bytes: bytes,
        csvString: csvString,
        parsedData: parsedData,
        fileName: fileName,
      );
    } catch (e) {
      return DownloadResult(
        success: false,
        error: e.toString(),
        fileName: fileName,
      );
    }
  }

  //Временный метод заргрузки одного файла
  Future<DownloadResult> tmdownloadSingleCSV(
    String fileName, {
    Function(int)? onProgress,
  }) async {
    try {
      if (onProgress != null) onProgress(10);

      final url = '$csvBaseUrl/$fileName';
      final response = await http.get(Uri.parse(url));

      if (onProgress != null) onProgress(30);

      if (response.statusCode != 200) {
        throw DownloadException(
          'Не удалось загрузить файл $url. Код статуса: ${response.statusCode}',
          response.statusCode,
        );
      }

      final bytes = response.bodyBytes;
      if (onProgress != null) onProgress(50);

      final csvString = utf8.decode(bytes);
      if (onProgress != null) onProgress(70);

      // Парсинг данных в зависимости от типа файла
      dynamic parsedData = _parseCSVData(fileName, csvString);

      if (onProgress != null) onProgress(80);

      // Получение директории для сохранения
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');

      // Сохранение файла
      await file.writeAsBytes(response.bodyBytes);

      if (onProgress != null) onProgress(100);

      return DownloadResult(
        success: true,
        filePath: file.path,
        bytes: bytes,
        csvString: csvString,
        parsedData: parsedData,
        fileName: fileName,
      );
    } catch (e) {
      return DownloadResult(
        success: false,
        error: e.toString(),
        fileName: fileName,
      );
    }
  }

  // Вспомогательный метод для парсинга данных
  dynamic _parseCSVData(String fileName, String csvString) {
    return _parserService.parseCSVByFileName(fileName, csvString);
  }

  // Загрузка конкретного файла по имени
  Future<DownloadResult> downloadCSV(String fileName) async {
    return await _downloadSingleCSV(fileName);
  }

  // Парсинг локального CSV файла
  Future<dynamic> parseLocalCSV(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');

      if (!await file.exists()) {
        throw Exception('Файл $fileName не найден');
      }

      final csvString = await file.readAsString();
      return _parseCSVData(fileName, csvString);
    } catch (e) {
      throw Exception('Ошибка чтения локального файла $fileName: $e');
    }
  }

  // Проверка существования файла
  Future<bool> fileExists(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    return await file.exists();
  }

  // Проверка существования всех файлов
  Future<Map<String, bool>> checkAllFilesExist() async {
    final Map<String, bool> results = {};

    for (final fileName in csvFiles) {
      results[fileName] = await fileExists(fileName);
    }

    return results;
  }

  // Получение пути к файлу
  Future<String?> getFilePath(String fileName) async {
    if (await fileExists(fileName)) {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}/$fileName';
    }
    return null;
  }

  // Получение статистики загрузки
  Future<DownloadStats> getDownloadStats() async {
    final stats = DownloadStats();
    final fileChecks = await checkAllFilesExist();

    for (final entry in fileChecks.entries) {
      if (entry.value) {
        stats.filesDownloaded++;
      } else {
        stats.filesMissing++;
      }
    }

    stats.totalFiles = csvFiles.length;

    return stats;
  }

  Future<void> _saveParsedData(String fileName, dynamic parsedData) async {
    switch (fileName) {
      case 'Factions.csv':
        //print('Star tdelete table');
        //await _db.dropTableFactions();
        final factionsList = parsedData.cast<Faction>();
        await _db.saveFactions(factionsList);
        await _db.debugLenTfaction();
        break;
      case 'Datasheets.csv':
        final datasheetList = parsedData.cast<Datasheet>();
        await _db.saveDatasheets(datasheetList);
        await _db.debugLenTdatasheet();
        break;
      case 'Abilities.csv':
        //await _db.dropTableAbility();
        //await _db.debugPrintTability();
        final abilityList = parsedData.cast<Ability>();
        await _db.saveAbility(abilityList);
        await _db.debugLenTability();
        break;
      case 'Datasheets_abilities.csv':
        //await _db.dropTableAbility();
        final datasheetAbilityList = parsedData.cast<DatasheetAbility>();
        await _db.saveDatasheetsAbility(datasheetAbilityList);
        await _db.debugLenTdatasheetAbility();
        break;
      case 'Datasheets_models.csv':
        final datasheetsModelsList = parsedData.cast<DatasheetModel>();
        await _db.saveDatasheetsModel(datasheetsModelsList);
        await _db.debugLenTdatasheetModel();
        break;
      case 'Enhancements.csv':
        final enhancementList = parsedData.cast<Enhancement>();
        await _db.saveEnhancement(enhancementList);
        await _db.debugLenTenhancement();
        break;
      case 'Detachments.csv':
        final detachmentList = parsedData.cast<Detachment>();
        await _db.saveDetachment(detachmentList);
        await _db.debugLenTdetachment();
        break;
      case 'Source.csv':
        final sourcetList = parsedData.cast<Source>();
        await _db.saveSource(sourcetList);
        await _db.debugLenTsource();
        break;
      case 'Stratagems.csv':
        final stratagemsList = parsedData.cast<Stratagem>();
        await _db.saveStratagem(stratagemsList);
        await _db.debugLenTstratagem();
        break;
      case 'Datasheets_detachment_abilities.csv':
        final datasheetDetachmentAbilityList =
            parsedData.cast<DatasheetDetachmentAbility>();
        await _db
            .saveDatasheetDetachmentAbility(datasheetDetachmentAbilityList);
        await _db.debugLedebugLenTdatasheetDetachmentAbilitynTsource();
        break;
      case 'Datasheets_enhancements.csv':
        final datasheetEnhancementList =
            parsedData.cast<DatasheetEnhancement>();
        await _db.saveDatasheetEnhancement(datasheetEnhancementList);
        await _db.debugLenTdatasheetEnhancement();
        break;
      case 'Datasheets_keywords.csv':
        final datasheetKeywordList = parsedData.cast<DatasheetKeyword>();
        await _db.saveDatasheetKeyword(datasheetKeywordList);
        await _db.debugLenTdatasheetKeyword();
        break;
      case 'Datasheets_leader.csv':
        final datasheetLeaderList = parsedData.cast<DatasheetLeader>();
        await _db.saveDatasheetLeader(datasheetLeaderList);
        await _db.debugLenTdatasheetLeader();
        break;
      case 'Datasheets_models_cost.csv':
        final datasheetModelCostList = parsedData.cast<DatasheetModelCost>();
        await _db.saveDatasheetModelCost(datasheetModelCostList);
        await _db.debugLenTdatasheetModelCost();
        break;
      case 'Datasheets_options.csv':
        final datasheetOptionList = parsedData.cast<DatasheetOption>();
        await _db.saveDatasheetOption(datasheetOptionList);
        await _db.debugLenTdatasheetOption();
        break;
      case 'Datasheets_stratagems.csv':
        final datasheetStratagemList = parsedData.cast<DatasheetStratagem>();
        await _db.saveDatasheetStratagem(datasheetStratagemList);
        await _db.debugLenTdatasheetStratagem();
        break;
      case 'Datasheets_unit_composition.csv':
        final datasheetUnitCompositionList =
            parsedData.cast<DatasheetUnitComposition>();
        await _db.saveDatasheetUnitComposition(datasheetUnitCompositionList);
        await _db.debugLenTdatasheetUnitComposition();
        break;
      case 'Datasheets_wargear.csv':
        final datasheetWargearList = parsedData.cast<DatasheetWargear>();
        await _db.saveDatasheetWargear(datasheetWargearList);
        await _db.debugLenTdatasheetWargear();
        break;
      case 'Detachment_abilities.csv':
        final detachmentAbilityList = parsedData.cast<DetachmentAbility>();
        await _db.saveDetachmentAbility(detachmentAbilityList);
        await _db.debugLenTdetachmentAbility();
        break;
      case 'Last_update.csv':
        final lastUpdateList = parsedData.cast<LastUpdate>();
        await _db.saveLastUpdate(lastUpdateList);
        await _db.debugLenTlastUpdate();
        break;
    }
  }
}

// Модель результата загрузки
class DownloadResult {
  final bool success;
  final String? filePath;
  final List<int>? bytes;
  final dynamic parsedData;
  final String? csvString;
  final String? error;
  final String? fileName;

  DownloadResult({
    required this.success,
    this.filePath,
    this.bytes,
    this.parsedData,
    this.csvString,
    this.error,
    this.fileName,
  });
}

// Статистика загрузки
class DownloadStats {
  int totalFiles = 0;
  int filesDownloaded = 0;
  int filesMissing = 0;

  double get progress => totalFiles > 0 ? filesDownloaded / totalFiles : 0;
  bool get isComplete => filesDownloaded == totalFiles;

  @override
  String toString() => 'Загружено: $filesDownloaded/$totalFiles файлов';
}

// Классы исключений
class DownloadException implements Exception {
  final String message;
  final int? statusCode;

  DownloadException(this.message, [this.statusCode]);

  @override
  String toString() => 'DownloadException: $message';
}
