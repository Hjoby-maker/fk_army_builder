// models/faction.dart

class Faction {
  final String id;
  final String name;
  final String? link;

  Faction({
    required this.id,
    required this.name,
    this.link,
  });

  factory Faction.fromCSV(List<String> row) {
    // Убираем BOM символ если есть
   /* String id = row[0];
    if (id.startsWith('\uFEFF')) {
      id = id.substring(1);
    }*/
    
    return Faction(
      id: row[0],
      name: row[1],
      link: row[2].isNotEmpty ? row[2] : null,
    );
  }
}