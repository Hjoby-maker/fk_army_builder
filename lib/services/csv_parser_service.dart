//import 'dart:convert';
import '../models/index.dart';
import '../globals/constants.dart';
import './helper/html_cleaner.dart';
// csv_parser_service.dart
class CSVParserService {

  dynamic parseCSVByFileName(String fileName, String csvString) {
  // Проверяем, что файл в списке поддерживаемых
  if (!csvFiles.contains(fileName)) {
    throw Exception('Файл $fileName не поддерживается');
  }
  switch (fileName) {
    case 'Factions.csv': return parseFactionsFromCSV(csvString);
    case 'Abilities.csv': return parseAbilitiesFromCSV(csvString);
    case 'Datasheets.csv': return parseDatasheetsFromCSV(csvString);
    case 'Detachments.csv': return parseDetachmentsFromCSV(csvString);
    case 'Enhancements.csv': return parseEnhancementsFromCSV(csvString);
    case 'Source.csv': return parseSourcesFromCSV(csvString);
    case 'Stratagems.csv': return parseStratagemsFromCSV(csvString);
    case 'Detachment_abilities.csv': return parseDetachmentAbilitiesFromCSV(csvString);
    case 'Last_update.csv': return parseLastUpdateFromCSV(csvString);
    case 'Datasheets_abilities.csv': return parseDatasheetAbilitiesFromCSV(csvString);
    case 'Datasheets_detachment_abilities.csv': return parseDatasheetDetachmentAbilitiesFromCSV(csvString);
    case 'Datasheets_enhancements.csv': return parseDatasheetEnhancementsFromCSV(csvString);
    case 'Datasheets_keywords.csv': return parseDatasheetKeywordsFromCSV(csvString);
    case 'Datasheets_leader.csv': return parseDatasheetLeadersFromCSV(csvString);
    case 'Datasheets_models.csv': return parseDatasheetModelsFromCSV(csvString);
    case 'Datasheets_models_cost.csv': return parseDatasheetModelCostsFromCSV(csvString);
    case 'Datasheets_options.csv': return parseDatasheetOptionsFromCSV(csvString);
    case 'Datasheets_stratagems.csv': return parseDatasheetStratagemsFromCSV(csvString);
    case 'Datasheets_unit_composition.csv': return parseDatasheetUnitCompositionsFromCSV(csvString);
    case 'Datasheets_wargear.csv': return parseDatasheetWargearFromCSV(csvString);
    default: throw Exception('Парсер для файла $fileName не реализован');
    }
  }

  // Общий метод для всех парсеров
  List<T> _parseCSV<T>(
    String csvString,
    T Function(List<String>) fromCSV,
    int minColumns,
    String typeName,
  ) {
    final rows = parseCSV(csvString);
    final result = <T>[];
   
    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];
      if (row.length >= minColumns) {
        try {
          result.add(fromCSV(row));
        } catch (e) {
          print('Ошибка парсинга $typeName строка ${i + 1}: $e');
          print('Данные строки: $row');
        }
      }
    }
  
  return result;
}

  List<Faction> parseFactionsFromCSV(String csvString) =>
    _parseCSV(csvString, Faction.fromCSV, 3, 'Faction');
    
  List<Ability> parseAbilitiesFromCSV(String csvString) =>
    _parseCSV(csvString, Ability.fromCSV, 5, 'Ability');
  
  List<Datasheet> parseDatasheetsFromCSV(String csvString) =>
    _parseCSV(csvString, Datasheet.fromCSV, 14, 'Datasheet');
  
  List<Detachment> parseDetachmentsFromCSV(String csvString) =>
    _parseCSV(csvString, Detachment.fromCSV, 7, 'Detachment');
  
  List<Enhancement> parseEnhancementsFromCSV(String csvString) =>
    _parseCSV(csvString, Enhancement.fromCSV, 8, 'Enhancement');
  
  List<Source> parseSourcesFromCSV(String csvString) =>
    _parseCSV(csvString, Source.fromCSV, 7, 'Source');
  
  List<Stratagem> parseStratagemsFromCSV(String csvString) =>
    _parseCSV(csvString, Stratagem.fromCSV, 11, 'Stratagem');
  
  List<DetachmentAbility> parseDetachmentAbilitiesFromCSV(String csvString) =>
    _parseCSV(csvString, DetachmentAbility.fromCSV, 7, 'DetachmentAbility');
  
  List<LastUpdate> parseLastUpdateFromCSV(String csvString) =>
    _parseCSV(csvString, LastUpdate.fromCSV, 1, 'LastUpdate');
  
  List<DatasheetAbility> parseDatasheetAbilitiesFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetAbility.fromCSV, 8, 'DatasheetAbility');
  
  List<DatasheetDetachmentAbility> parseDatasheetDetachmentAbilitiesFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetDetachmentAbility.fromCSV, 2, 'DatasheetDetachmentAbility');
  
  List<DatasheetEnhancement> parseDatasheetEnhancementsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetEnhancement.fromCSV, 2, 'DatasheetEnhancement');
  
  List<DatasheetKeyword> parseDatasheetKeywordsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetKeyword.fromCSV, 4, 'DatasheetKeyword');
  
  List<DatasheetLeader> parseDatasheetLeadersFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetLeader.fromCSV, 2, 'DatasheetLeader');
  
  List<DatasheetModel> parseDatasheetModelsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetModel.fromCSV, 13, 'DatasheetModel');
  
  List<DatasheetModelCost> parseDatasheetModelCostsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetModelCost.fromCSV, 4, 'DatasheetModelCost');
  
  List<DatasheetOption> parseDatasheetOptionsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetOption.fromCSV, 4, 'DatasheetOption');
  
  List<DatasheetStratagem> parseDatasheetStratagemsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetStratagem.fromCSV, 2, 'DatasheetStratagem');
  
  List<DatasheetUnitComposition> parseDatasheetUnitCompositionsFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetUnitComposition.fromCSV, 3, 'DatasheetUnitComposition');
  
  List<DatasheetWargear> parseDatasheetWargearFromCSV(String csvString) =>
    _parseCSV(csvString, DatasheetWargear.fromCSV, 13, 'DatasheetWargear');
  
  // Базовый парсер CSV с разделителем |
  List<List<String>> parseCSV(String csvString, {String delimiter = '|'}) {
    final lines = csvString.split('\n');
    final result = <List<String>>[];
    
    for (final line in lines) {
      if (line.trim().isEmpty) continue;
        //print(line);
        String cleanline = HtmlCleaner.clean(line);
        //print(cleanline);
      // Обработка кавычек и экранирования
       try {
        final row = _parseCSVLine(cleanline, delimiter);
        result.add(row);
      } catch (e) {
        //print('Ошибка парсинга строки ${cleanline.length+ 1}: $e');
        //print('Содержимое строки: "$cleanline"');
        // Пропускаем проблемную строку или добавляем пустую
        result.add([]);
      }
    }
    
    return result;
  }
  
  List<String> _parseCSVLine(String line, String delimiter) {
    final result = <String>[];
    StringBuffer current = StringBuffer();
    bool inQuotes = false;
    bool escapeNext = false;
    
    for (int i = 0; i < line.length; i++) {
      final char = line[i];
      if (escapeNext) {
        current.write(char);
        escapeNext = false;
        continue;
      }

      if (char == '\\') {
        escapeNext = true;
        continue;
      }

      /*if (char == '"') {
        // Проверяем, не является ли это экранированной кавычкой
        if (i + 1 < line.length && line[i + 1] == '"') {
          current.write('"');
          i++; // Пропускаем следующую кавычку
        } else {
          inQuotes = !inQuotes;
        }
      } else*/ if (char == delimiter && !inQuotes) {
        result.add(current.toString().trim());
        current.clear();
      } else {
        current.write(char);
      }
     // print(char);
     // print(inQuotes.toString());
     // print(current.toString());
    }
    
    // Добавляем последнее значение
    result.add(current.toString());
    
    return result;
  }
}