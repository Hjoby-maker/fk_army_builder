import '../services/helper/csv_parser_utils.dart';

// models/datasheet_detachment_ability.dart
class DatasheetDetachmentAbility {
  final int datasheetId;
  final int detachmentAbilityId;

  DatasheetDetachmentAbility({
    required this.datasheetId,
    required this.detachmentAbilityId,
  });

  factory DatasheetDetachmentAbility.fromCSV(List<String> row) {
    return DatasheetDetachmentAbility(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      detachmentAbilityId: CSVParserUtils.parseRequiredInt(row, 1, 'detachmentAbilityId'),
    );
  }
}