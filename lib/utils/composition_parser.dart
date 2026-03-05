// lib/utils/composition_parser.dart

class ParsedComponent {
  final String name;
  final int min;
  final int max;

  ParsedComponent({
    required this.name,
    required this.min,
    required this.max,
  });
}

class CompositionParser {
  // Парсит строку вида "9-19 Boyz" или "1 Boss Nob"
  static ParsedComponent parseComponent(String description) {
    final regex = RegExp(r'^(\d+)(?:-(\d+))?\s+(.+)$');
    final match = regex.firstMatch(description);

    if (match != null) {
      final minStr = match.group(1);
      final maxStr = match.group(2);
      final name = match.group(3) ?? '';

      final min = int.parse(minStr!);
      final max = maxStr != null ? int.parse(maxStr) : min;

      return ParsedComponent(name: name, min: min, max: max);
    }

    // Если не удалось распарсить, возвращаем как есть
    return ParsedComponent(name: description, min: 0, max: 0);
  }

  // Парсит строку вида "20 models" или "10 models"
  static int parseModelCount(String description) {
    final regex = RegExp(r'^(\d+)\s+models?$');
    final match = regex.firstMatch(description);

    if (match != null) {
      return int.parse(match.group(1)!);
    }

    return 0;
  }
}
