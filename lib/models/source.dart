import '../services/helper/csv_parser_utils.dart';

// models/source.dart

class Source {
  final int id;
  final String name;
  final String? type;
  final int? edition;
  final String? version;
  final DateTime? errataDate;
  final String? errataLink;

  Source({
    required this.id,
    required this.name,
    required this.type,
    required this.edition,
    required this.version,
    this.errataDate,
    required this.errataLink,
  });

  factory Source.fromCSV(List<String> row) {
    // Убираем BOM символ если есть
    String id = row[0];
    if (id.startsWith('\uFEFF')) {
      id = id.substring(1);
    }
    
    return Source(
      id: CSVParserUtils.parseRequiredInt(row, 0, 'id'),
      name: row[1],
      type: row[2],
      edition: CSVParserUtils.parseOptionalInt(row, 3),
      version: row[4].isNotEmpty ? row[4] : null,
      errataDate: CSVParserUtils.parseOptionalDateTime(row, 5),
      errataLink: row[6].isNotEmpty ? row[6] : null,
    );
  }
}