import '../services/helper/csv_parser_utils.dart';


// models/ability.dart

class Ability {
  final int id;
  final String name;
  final String? legend;
  final String? factionId;
  final String? description;

  Ability({
    required this.id,
    required this.name,
    this.legend,
    this.factionId,
    this.description,
  });

  factory Ability.fromCSV(List<String> row) {
    return Ability(
      id: CSVParserUtils.parseRequiredInt(row, 0, 'id'),
      name: row[1],
      legend: row[2].isNotEmpty ? row[2] : null,
      factionId: row[3].isNotEmpty ? row[4] : null,
      description: row[4].isNotEmpty ? row[4] : null,
    );
  }
}