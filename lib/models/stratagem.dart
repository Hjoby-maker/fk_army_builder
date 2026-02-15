import '../services/helper/csv_parser_utils.dart';

// models/stratagem.dart

class Stratagem {
  final String? factionId;
  final String? name;
  final int id;
  final String? type;
  final int? commandPointCost;
  final String? legend;
  final String? turn;
  final String? phase;
  final String? detachment;
  final int? detachmentId;
  final String? description;

  Stratagem({
    this.factionId,
    this.name,
    required this.id,
    this.type,
    this.commandPointCost,
    this.legend,
    this.turn,
    this.phase,
    this.detachment,
    this.detachmentId,
    this.description,
  });

  factory Stratagem.fromCSV(List<String> row) {
    return Stratagem(
      factionId: row[0].isNotEmpty ? row[0] : null,
      name: row[1].isNotEmpty ? row[1] : null,
      id: CSVParserUtils.parseRequiredInt(row, 2, 'id'),
      type: row[3].isNotEmpty ? row[3] : null,
      commandPointCost: CSVParserUtils.parseOptionalInt(row, 4),
      legend: row[5].isNotEmpty ? row[5] : null,
      turn: row[6].isNotEmpty ? row[6] : null,
      phase: row[7].isNotEmpty ? row[7] : null,
      detachment: row[8].isNotEmpty ? row[8] : null,
      detachmentId:  CSVParserUtils.parseOptionalInt(row, 9),
      description: row[10].isNotEmpty ? row[10] : null,
    );
  }
}