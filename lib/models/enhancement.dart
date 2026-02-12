import '../services/helper/csv_parser_utils.dart';

// models/enhancement.dart
 
class Enhancement {
  final String factionId;
  final int id;
  final String name;
  final int cost;
  final String? detachment;
  final int? detachmentId;
  final String? legend;
  final String? description;

  Enhancement({
    required this.factionId,
    required this.id,
    required this.name,
    required this.cost,
    this.detachment,
    this.detachmentId,
    this.legend,
    this.description,
  });

  factory Enhancement.fromCSV(List<String> row) {
    return Enhancement(
      factionId: row[0],
      id: CSVParserUtils.parseRequiredInt(row, 1, 'id'),
      name: row[2],
      cost: CSVParserUtils.parseRequiredInt(row, 3, 'cost'),
      detachment: row[4].isNotEmpty ? row[4] : null,
      detachmentId: CSVParserUtils.parseOptionalInt(row, 5),
      legend: row[6].isNotEmpty ? row[6] : null,
      description: row[7].isNotEmpty ? row[7] : null,
    );
  }
}