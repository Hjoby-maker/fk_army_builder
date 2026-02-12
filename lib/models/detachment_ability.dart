import '../services/helper/csv_parser_utils.dart';

// models/detachment_ability.dart

class DetachmentAbility {
  final int id;
  final String factionId;
  final String name;
  final String? legend;
  final String? description;
  final String? detachment;
  final int? detachmentId;

  DetachmentAbility({
    required this.id,
    required this.factionId,
    required this.name,
    this.legend,
    this.description,
    this.detachment,
    this.detachmentId,
  });

  factory DetachmentAbility.fromCSV(List<String> row) {
    return DetachmentAbility(
      id: CSVParserUtils.parseRequiredInt(row, 0, 'id'),
      factionId: row[1],
      name: row[2],
      legend: row[3].isNotEmpty ? row[3] : null,
      description: row[4].isNotEmpty ? row[4] : null,
      detachment: row[5].isNotEmpty ? row[5] : null,
      detachmentId: CSVParserUtils.parseOptionalInt(row, 6),
    );
  }
}