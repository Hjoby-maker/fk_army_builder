import '../services/helper/csv_parser_utils.dart';

// models/datasheet.dart

class Datasheet {
  final int id;
  final String name;
  final String factionId;
  final int sourceId;
  final String? legend; 
  final String? role;
  final String? loadout;
  final String? transport;
  final bool? virtual;
  final String? leaderHead;
  final String? leaderFooter;
  final String? damagedW;
  final String? damagedDescription;
  final String? link;

  Datasheet({
    required this.id,
    required this.name,
    required this.factionId,
    required this.sourceId,
    this.legend,
    this.role,
    this.loadout,
    this.transport,
    this.virtual,
    this.leaderHead,
    this.leaderFooter,
    this.damagedW,
    this.damagedDescription,
    this.link,
  });

  factory Datasheet.fromCSV(List<String> row) {
    return Datasheet(
      id: CSVParserUtils.parseRequiredInt(row, 0, 'id'),
      name: row[1],
      factionId: row[2],
      sourceId: CSVParserUtils.parseRequiredInt(row, 3, 'sourceId'),
      legend: row[4].isNotEmpty ? row[4] : null,
      role: row[5].isNotEmpty ? row[5] : null,
      loadout: row[6].isNotEmpty ? row[6] : null,
      transport: row[7].isNotEmpty ? row[7] : null,
      virtual: CSVParserUtils.parseOptionalBool(row, 8),
      leaderHead: row[9].isNotEmpty ? row[9] : null,
      leaderFooter: row[10].isNotEmpty ? row[10] : null,
      damagedW: row[11].isNotEmpty ? row[11] : null,
      damagedDescription: row[12].isNotEmpty ? row[12] : null,
      link: row[13].isNotEmpty ? row[13] : null,
    );
  }
}