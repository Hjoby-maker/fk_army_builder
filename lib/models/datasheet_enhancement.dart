import '../services/helper/csv_parser_utils.dart';

// models/datasheet_enhancement.dart
class DatasheetEnhancement {
  final int datasheetId;
  final int enhancementId;

  DatasheetEnhancement({
    required this.datasheetId,
    required this.enhancementId,
  });

  factory DatasheetEnhancement.fromCSV(List<String> row) {
    return DatasheetEnhancement(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      enhancementId: CSVParserUtils.parseRequiredInt(row, 0, 'enhancementId'),
    );
  }
}