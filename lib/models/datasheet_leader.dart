import '../services/helper/csv_parser_utils.dart';

// models/datasheet_leader.dart

class DatasheetLeader {
  final int leaderId;
  final int attachedId;

  DatasheetLeader({
    required this.leaderId,
    required this.attachedId,
  });

  factory DatasheetLeader.fromCSV(List<String> row) {
    return DatasheetLeader(
      leaderId: CSVParserUtils.parseRequiredInt(row, 0, 'leaderId'),
      attachedId: CSVParserUtils.parseRequiredInt(row, 1, 'attachedId'),
    );
  }
}