// lib/services/file_cleanup_service.dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../globals/constants.dart';

class FileCleanupService {
  
  // Удалить все CSV файлы
  Future<CleanupResult> deleteAllCSVFiles() async {
     return await _cleanLocalFiles();
  }
  
  // Удалить конкретный файл
  Future<bool> deleteFile(String fileName) async {
    return await _deleteLocalFile(fileName);
  }
  
  // Очистка локальных файлов (Android/iOS)
  Future<CleanupResult> _cleanLocalFiles() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final appDir = Directory('${directory.path}/$appDocumentsDir');
      final armiesDir = Directory('${directory.path}/$appDocumentsDir/$armiesSubdir');
      final exportsDir = Directory('${directory.path}/$appDocumentsDir/$exportsSubdir');
      
      int deletedFiles = 0;
      int failedDeletions = 0;
      List<String> deletedFileNames = [];
      List<String> failedFileNames = [];
      
      // Удаляем все CSV файлы
      for (final fileName in csvFiles) {
        final file = File('${directory.path}/$fileName');
        if (await file.exists()) {
          try {
            await file.delete();
            deletedFiles++;
            deletedFileNames.add(fileName);
          } catch (e) {
            failedDeletions++;
            failedFileNames.add(fileName);
          }
        }
      }
      
      // Удаляем папку с армиями (если пуста)
      if (await armiesDir.exists()) {
        try {
          final contents = await armiesDir.list().toList();
          if (contents.isEmpty) {
            await armiesDir.delete();
          }
        } catch (e) {
          // Игнорируем ошибки удаления папки
        }
      }
      
      // Удаляем папку с экспортами (если пуста)
      if (await exportsDir.exists()) {
        try {
          final contents = await exportsDir.list().toList();
          if (contents.isEmpty) {
            await exportsDir.delete();
          }
        } catch (e) {
          // Игнорируем ошибки удаления папки
        }
      }
      
      // Удаляем основную папку (если пуста)
      if (await appDir.exists()) {
        try {
          final contents = await appDir.list().toList();
          if (contents.isEmpty) {
            await appDir.delete();
          }
        } catch (e) {
          // Игнорируем ошибки удаления папки
        }
      }
      
      return CleanupResult(
        success: true,
        deletedFiles: deletedFiles,
        failedDeletions: failedDeletions,
        totalFiles: csvFiles.length,
        deletedFileNames: deletedFileNames,
        failedFileNames: failedFileNames,
        message: 'Удалено $deletedFiles файлов, не удалось удалить $failedDeletions файлов',
      );
      
    } catch (e) {
      return CleanupResult(
        success: false,
        error: e.toString(),
        message: 'Ошибка при удалении файлов: $e',
      );
    }
  }
  
  // Удаление локального файла
  Future<bool> _deleteLocalFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');
      
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
  
  // Получить общий размер загруженных файлов
  Future<int> getTotalFileSize() async {
    return await _getLocalFileSize();
  }
  
  // Получить размер локальных файлов
  Future<int> _getLocalFileSize() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      int totalSize = 0;
      
      for (final fileName in csvFiles) {
        final file = File('${directory.path}/$fileName');
        if (await file.exists()) {
          totalSize += await file.length();
        }
      }
      
      return totalSize;
    } catch (e) {
      return 0;
    }
  }
  
  // Получить форматированный размер
  Future<String> getFormattedFileSize() async {
    final sizeInBytes = await getTotalFileSize();
    
    if (sizeInBytes == 0) return '0 Б';
    
    const sizes = ['Б', 'КБ', 'МБ', 'ГБ'];
    int i = 0;
    double size = sizeInBytes.toDouble();
    
    while (size >= 1024 && i < sizes.length - 1) {
      size /= 1024;
      i++;
    }
    
    return '${size.toStringAsFixed(2)} ${sizes[i]}';
  }
  
  // Проверить, есть ли загруженные файлы
  Future<bool> hasDownloadedFiles() async {
    return await _hasLocalFiles();
  }
  
  Future<bool> _hasLocalFiles() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      
      for (final fileName in csvFiles) {
        final file = File('${directory.path}/$fileName');
        if (await file.exists()) {
          return true;
        }
      }
      
      return false;
    } catch (e) {
      return false;
    }
  }
}

// Модель результата очистки
class CleanupResult {
  final bool success;
  final int deletedFiles;
  final int failedDeletions;
  final int totalFiles;
  final List<String> deletedFileNames;
  final List<String> failedFileNames;
  final String? error;
  final String message;
  final bool isWeb;
  
  CleanupResult({
    required this.success,
    this.deletedFiles = 0,
    this.failedDeletions = 0,
    this.totalFiles = 0,
    this.deletedFileNames = const [],
    this.failedFileNames = const [],
    this.error,
    required this.message,
    this.isWeb = false,
  });
  
  double get successRate => totalFiles > 0 ? deletedFiles / totalFiles : 0;
}