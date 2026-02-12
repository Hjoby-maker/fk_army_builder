import '../services/helper/csv_parser_utils.dart';

// models/datasheet_ability.dart
class DatasheetAbility {
  final int datasheetId;
  final int line;
  final int? abilityId;
  final String? model;
  final String? name;
  final String? description;
  final String? type;
  final String? parameter;

  DatasheetAbility({
    required this.datasheetId,
    required this.line,
    this.abilityId,
    this.model,
    this.name,
    this.description,
    this.type,
    this.parameter,
  });

  factory DatasheetAbility.fromCSV(List<String> row) {
    return DatasheetAbility(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      line:  CSVParserUtils.parseRequiredInt(row, 1, 'line'),
      abilityId: CSVParserUtils.parseOptionalInt(row, 2),
      model: row[3].isNotEmpty ? row[3] : null,
      name: row[4].isNotEmpty ? row[4] : null,
      description: row[5].isNotEmpty ? row[5] : null,
      type: row[6].isNotEmpty ? row[6] : null,
      parameter: row[7].isNotEmpty ? row[7] : null,
    );
  }
}