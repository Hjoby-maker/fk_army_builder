class CSVParserUtils {
  static String parseRequiredString(List<String> row, int index, String fieldName) {
    if (row.length <= index) {
      throw FormatException('Недостаточно колонок для поля $fieldName');
    }
    if (row[index].isEmpty) {
      throw FormatException('Поле $fieldName не может быть пустым');
    }
    return row[index];
  }
  
  static String? parseOptionalString(List<String> row, int index) {
    if (row.length <= index || row[index].isEmpty) {
      return null;
    }
    return row[index];
  }
  
  static int parseRequiredInt(List<String> row, int index, String fieldName) {
    final value = parseRequiredString(row, index, fieldName);
    final parsed = safeParseInt(value);
    //if (parsed == null) {
    //  throw FormatException('Поле $fieldName должно быть числом. Получено: $value');
    //}
    
    return parsed;
  }
  
  static int? parseOptionalInt(List<String> row, int index) {
    final value = parseOptionalString(row, index);
    if (value == null) return null;
    
    return int.tryParse(value.replaceAll(RegExp(r'[^0-9\-]'), ''));
  }
  
  static bool parseRequiredBool(List<String> row, int index, String fieldName) {
    final value = parseRequiredString(row, index, fieldName).toLowerCase();
    return value == 'true' || value == '1' || value == 'yes';
  }
  
  static bool? parseOptionalBool(List<String> row, int index) {
    final value = parseOptionalString(row, index);
    if (value == null) return null;
    
    return value.toLowerCase() == 'true' || value == '1' || value == 'yes';
  }
  
  static int safeParseInt(String value, {int defaultValue = 0}) {
    if (value.isEmpty) return defaultValue;
    
    // Убираем все кроме цифр и минуса
    final cleaned = value.replaceAll(RegExp(r'[^0-9\-]'), '');
    if (cleaned.isEmpty) return defaultValue;
    
    return int.tryParse(cleaned) ?? defaultValue;
  }

  /// Парсит обязательное поле DateTime из строки формата "dd.MM.yyyy H:mm:ss"
  static DateTime parseRequiredDateTime(List<String> row, int index, String fieldName) {
    final value = parseRequiredString(row, index, fieldName);
    final parsed = tryParseDateTime(value);
    
    if (parsed == null) {
      throw FormatException('Поле $fieldName должно быть датой в формате ДД.ММ.ГГГГ ЧЧ:мм:сс. Получено: $value');
    }
    
    return parsed;
  }
  
  /// Парсит необязательное поле DateTime из строки формата "dd.MM.yyyy H:mm:ss"
  /// Возвращает null, если значение отсутствует или не может быть распарсено
  static DateTime? parseOptionalDateTime(List<String> row, int index) {
    final value = parseOptionalString(row, index);
    if (value == null) return null;
    
    return tryParseDateTime(value);
  }
  
  /// Пытается распарсить строку в DateTime, поддерживая несколько форматов
  static DateTime? tryParseDateTime(String value) {
    if (value.isEmpty) return null;
    
    // Основной ожидаемый формат: "dd.MM.yyyy H:mm:ss"
    try {
      // Пробуем стандартный формат
      final dateParts = value.split(' ');
      if (dateParts.isNotEmpty) {
        final datePart = dateParts[0];
        final timePart = dateParts.length > 1 ? dateParts[1] : '0:00:00';
        
        final dateComponents = datePart.split('.');
        if (dateComponents.length == 3) {
          final day = int.tryParse(dateComponents[0]);
          final month = int.tryParse(dateComponents[1]);
          final year = int.tryParse(dateComponents[2]);
          
          final timeComponents = timePart.split(':');
          final hour = timeComponents.isNotEmpty ? int.tryParse(timeComponents[0]) ?? 0 : 0;
          final minute = timeComponents.length > 1 ? int.tryParse(timeComponents[1]) ?? 0 : 0;
          final second = timeComponents.length > 2 ? int.tryParse(timeComponents[2]) ?? 0 : 0;
          
          if (day != null && month != null && year != null) {
            return DateTime(year, month, day, hour, minute, second);
          }
        }
      }
      
      // Если не удалось распарсить вручную, пробуем стандартные форматы
      // Удаляем возможные лишние пробелы
      final trimmedValue = value.trim();
      
      // Пробуем парсить с учетом разных разделителей
      final formats = [
        'dd.MM.yyyy H:mm:ss',
        'dd.MM.yyyy HH:mm:ss',
        'dd.MM.yyyy',
        'yyyy-MM-dd HH:mm:ss',
        'yyyy/MM/dd HH:mm:ss',
      ];
      
      for (final format in formats) {
        try {
          // Для простоты реализации используем try-catch
          // В реальном приложении можно использовать пакет intl для более надежного парсинга
          if (format.contains('.')) {
            // Формат с точками
            final regex = RegExp(r'(\d{2})\.(\d{2})\.(\d{4})');
            final match = regex.firstMatch(trimmedValue);
            if (match != null) {
              final day = int.parse(match.group(1)!);
              final month = int.parse(match.group(2)!);
              final year = int.parse(match.group(3)!);
              
              // Извлекаем время, если оно есть
              int hour = 0, minute = 0, second = 0;
              final timeRegex = RegExp(r'(\d{1,2}):(\d{2}):(\d{2})');
              final timeMatch = timeRegex.firstMatch(trimmedValue);
              if (timeMatch != null) {
                hour = int.parse(timeMatch.group(1)!);
                minute = int.parse(timeMatch.group(2)!);
                second = int.parse(timeMatch.group(3)!);
              }
              
              return DateTime(year, month, day, hour, minute, second);
            }
          }
        } catch (_) {
          continue;
        }
      }
    } catch (_) {
      return null;
    }
    
    return null;
  }
}