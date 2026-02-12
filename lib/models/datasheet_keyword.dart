import '../services/helper/csv_parser_utils.dart';

// models/datasheet_keyword.dart

class DatasheetKeyword {
  final int datasheetId;
  final String? keyword;
  final String? model;
  final bool isFactionKeyword;

  DatasheetKeyword({
    required this.datasheetId,
    this.keyword,
    this.model,
    required this.isFactionKeyword,
  });

  factory DatasheetKeyword.fromCSV(List<String> row) {
    return DatasheetKeyword(
      datasheetId: CSVParserUtils.parseRequiredInt(row, 0, 'datasheetId'),
      keyword: row[1].isNotEmpty ? row[1] : null,
      model: row[2].isNotEmpty ? row[2] : null,
      isFactionKeyword: CSVParserUtils.parseRequiredBool(row, 3, 'isFactionKeyword'),
    );
  }
}