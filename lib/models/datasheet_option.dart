import '../services/helper/csv_parser_utils.dart';

// models/datasheet_option.dart

class DatasheetOption {
  final int datasheetId;
  final int line;
  final String? button;
  final String? description;

  DatasheetOption({
    required this.datasheetId,
    required this.line,
    this.button,
    this.description,
  });

  factory DatasheetOption.fromCSV(List<String> row) {
    return DatasheetOption(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      line: CSVParserUtils.parseRequiredInt(row, 1, 'line'),
      button:  row[2].isNotEmpty ? row[2] : null, 
      description:  row[3].isNotEmpty ? row[3] : null,
    );
  }
}