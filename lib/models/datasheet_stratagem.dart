import '../services/helper/csv_parser_utils.dart';

// models/datasheet_stratagem.dart
 
class DatasheetStratagem {
  final int datasheetId;
  final int stratagemId;

  DatasheetStratagem({
    required this.datasheetId,
    required this.stratagemId,
  });

  factory DatasheetStratagem.fromCSV(List<String> row) {
    return DatasheetStratagem(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      stratagemId: CSVParserUtils.parseRequiredInt(row, 1, 'stratagemId'),
    );
  }
}