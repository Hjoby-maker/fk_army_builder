// models/last_update.dart

class LastUpdate {
  final DateTime lastUpdate;

  LastUpdate({
    required this.lastUpdate,
  });

  factory LastUpdate.fromCSV(List<String> row) {
    String dateStr = row[0];
    if (dateStr.startsWith('\uFEFF')) {
      dateStr = dateStr.substring(1);
    }
    
    return LastUpdate(
      lastUpdate: DateTime.parse(dateStr),
    );
  }
}