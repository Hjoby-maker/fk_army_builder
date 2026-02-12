import '../services/helper/csv_parser_utils.dart';

// models/datasheet_wargear.dart
class DatasheetWargear {
  final int datasheetId;
  final int? line;
  final int lineInWargear;
  final String? dice;
  final String? name;
  final String? description;
  final int? range;
  final String? type;
  final int? attacks;
  final String? ballisticSkill;
  final int? strength;
  final int? armorPenetration;
  final String? damage;

  DatasheetWargear({
    required this.datasheetId,
    this.line,
    required this.lineInWargear,
    this.dice,
    this.name,
    this.description,
    this.range,
    this.type,
    this.attacks,
    this.ballisticSkill,
    this.strength,
    this.armorPenetration,
    this.damage,
  });

  factory DatasheetWargear.fromCSV(List<String> row) {
    return DatasheetWargear(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      line: CSVParserUtils.parseOptionalInt(row, 1),
      lineInWargear: CSVParserUtils.parseRequiredInt(row, 2, 'lineInWargear'),
      dice: row[3].isNotEmpty ? row[3] : null,
      name: row[4].isNotEmpty ? row[4] : null,
      description: row[5].isNotEmpty ? row[5] : null,
      range: CSVParserUtils.parseOptionalInt(row, 6),
      type: row[7].isNotEmpty ? row[7] : null,
      attacks: CSVParserUtils.parseOptionalInt(row, 8),
      ballisticSkill: row[9].isNotEmpty ? row[9] : null,
      strength: CSVParserUtils.parseOptionalInt(row, 10),
      armorPenetration: CSVParserUtils.parseOptionalInt(row, 11),
      damage: row[12].isNotEmpty ? row[12] : null,
    );
  }
}