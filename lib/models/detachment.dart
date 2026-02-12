import '../services/helper/csv_parser_utils.dart';

// models/detachment.dart
 
class Detachment {
  final int id;
  final String factionId;
  final String name;
  final String? legend;
  final String? type;

  Detachment({
    required this.id,
    required this.factionId,
    required this.name,
    this.legend,
    this.type,
  });

  factory Detachment.fromCSV(List<String> row) {
    return Detachment(
      id: CSVParserUtils.parseRequiredInt(row, 0, 'id'),
      factionId: row[1],
      name: row[2],
      legend: row[3].isNotEmpty ? row[3] : null,
      type: row[4].isNotEmpty ? row[4] : null,
    );
  }
}