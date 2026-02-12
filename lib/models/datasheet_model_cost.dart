import '../services/helper/csv_parser_utils.dart';

// models/datasheet_model_cost.dart

class DatasheetModelCost {
  final int datasheetId;
  final int line;
  final String? description;
  final int? cost;

  DatasheetModelCost({
    required this.datasheetId,
    required this.line,
    this.description,
    this.cost,
  });

  factory DatasheetModelCost.fromCSV(List<String> row) {
    return DatasheetModelCost(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      line: CSVParserUtils.parseRequiredInt(row, 1, 'line'),
      description: CSVParserUtils.parseOptionalString(row, 2),
      cost: CSVParserUtils.parseOptionalInt(row, 3),
    );
  }
}