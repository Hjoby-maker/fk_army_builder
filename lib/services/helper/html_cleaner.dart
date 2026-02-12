// html_cleaner.dart
class HtmlCleaner {
  static String clean(String htmlText) {
    if (htmlText.isEmpty) return htmlText;
    
    String result = htmlText;
    
    // Удаление HTML тегов
    final tagPattern = RegExp(r'<[^>]*>');
    result = result.replaceAll(tagPattern, '');
    
    // Замена HTML entities
    final entities = {
      '&nbsp;': ' ',
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&quot;': '"',
      '&#39;': "'",
      '&ldquo;': '"',
      '&rdquo;': '"',
      '&lsquo;': "'",
      '&rsquo;': "'",
      '&mdash;': '—',
      '&ndash;': '–',
      '&bull;': '•',
      '&copy;': '©',
      '&reg;': '®',
      '&#8217;': "'", // еще один вариант апострофа
      '&#8220;': '"', // еще один вариант кавычки
      '&#8221;': '"',
    };
    
    entities.forEach((entity, replacement) {
      result = result.replaceAll(entity, replacement);
    });
    
    // Удаление лишних пробелов
    result = result
        .replaceAll(RegExp(r'\s+'), ' ') // Множественные пробелы в один
        .trim();
    
    return result;
  }
  
  // Специальная очистка для HTML со стилями
  static String cleanWithStyles(String htmlText) {
    if (htmlText.isEmpty) return htmlText;
    
    // Сначала обрабатываем специальные теги
    String result = htmlText;
    
    // Сохраняем структуру списков
    result = result
        .replaceAll(RegExp(r'<li[^>]*>'), '\n• ')
        .replaceAll(RegExp(r'</li>'), '')
        .replaceAll(RegExp(r'<ul[^>]*>'), '\n')
        .replaceAll(RegExp(r'</ul>'), '\n')
        .replaceAll(RegExp(r'<ol[^>]*>'), '\n')
        .replaceAll(RegExp(r'</ol>'), '\n');
    
    // Заменяем переносы строк
    result = result
        .replaceAll(RegExp(r'<br\s*/?>'), '\n')
        .replaceAll(RegExp(r'<p[^>]*>'), '\n')
        .replaceAll(RegExp(r'</p>'), '\n');
    
    // Затем удаляем все остальные теги
    result = clean(result);
    
    // Чистим лишние переносы строк
    result = result
        .replaceAll(RegExp(r'\n\s*\n'), '\n\n') // Оставляем только двойные переносы
        .trim();
    
    return result;
  }
}