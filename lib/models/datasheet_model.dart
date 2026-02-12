import '../services/helper/csv_parser_utils.dart';
// models/datasheet_model.dart

class DatasheetModel {
  final int datasheetId;
  final int line;
  final String name;
  final int move;
  final int toughness;
  final String save;
  final String? invulnerableSave;
  final String? invulnerableSaveDescription;
  final int wounds;
  final String leadership;
  final int objectiveControl;
  final String baseSize;
  final String? baseSizeDescription;

  DatasheetModel({
    required this.datasheetId,
    required this.line,
    required this.name,
    required this.move,
    required this.toughness,
    required this.save,
    this.invulnerableSave,
    this.invulnerableSaveDescription,
    required this.wounds,
    required this.leadership,
    required this.objectiveControl,
    required this.baseSize,
    this.baseSizeDescription,
  });

  factory DatasheetModel.fromCSV(List<String> row) {
    return DatasheetModel(
      datasheetId:  CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      line:  CSVParserUtils.parseRequiredInt(row, 1, 'line'),
      name: row[2],
      move: CSVParserUtils.parseRequiredInt(row, 3, 'move'),
      toughness: CSVParserUtils.parseRequiredInt(row, 4, 'toughness'),
      save: row[5],
      invulnerableSave: row[6].isNotEmpty ? row[6] : null,
      invulnerableSaveDescription: row[7].isNotEmpty ? row[7] : null,
      wounds: CSVParserUtils.parseRequiredInt(row, 8, 'wounds'),
      leadership: row[9],
      objectiveControl: CSVParserUtils.parseRequiredInt(row, 10, 'objectiveControl'),
      baseSize: row[11],
      baseSizeDescription: row[12].isNotEmpty ? row[12] : null,
    );
  }
}