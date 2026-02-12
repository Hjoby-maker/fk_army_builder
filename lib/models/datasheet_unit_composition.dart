import '../services/helper/csv_parser_utils.dart';

// models/datasheet_unit_composition.dart

class DatasheetUnitComposition {
  final int datasheetId;
  final int line;
  final String? description;

  DatasheetUnitComposition({
    required this.datasheetId,
    required this.line,
    this.description,
  });

  factory DatasheetUnitComposition.fromCSV(List<String> row) {
    return DatasheetUnitComposition(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      line: CSVParserUtils.parseRequiredInt(row, 1, 'line'),
      description: row[2].isNotEmpty ? row[2] : null,
    );
  }
}