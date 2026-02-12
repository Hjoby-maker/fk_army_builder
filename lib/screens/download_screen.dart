//import 'package:fk_army_builder/models/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/csv_download_service.dart';
import '../globals/app_state.dart';
import '../globals/constants.dart';
import '../services/file_cleanup_service.dart';


//import '../services/helper/csv_parser_utils.dart';
//import '../services/csv_parser_service.dart'; // Добавлен импорт временно для отладки

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  
 
  final CSVDownloadService _downloadService = CSVDownloadService();
  final FileCleanupService _cleanupService = FileCleanupService();
  //final CSVParserService _parserService = CSVParserService(); // Добавлен парсер временно для отладки
  
  bool _isDownloading = false;
  bool _downloadComplete = false;
  bool _hasFilesToDelete = false;
  String _totalFileSize = '0 Б';
  String _downloadStatus = '';
  final Map<String, int> _fileProgress = {};
  final Map<String, bool> _fileResults = {};
  DateTime? _startTime;
  DateTime? _endTime;
  int _successfulDownloads = 0;
  int _failedDownloads = 0;
  String? _errorMessage;

  Duration? get _downloadDuration {
    if (_startTime != null && _endTime != null) {
      return _endTime!.difference(_startTime!);
    }
    return null;
  }

  double get _overallProgress {
    if (_fileProgress.isEmpty) return 0.0;
    
    final totalProgress = _fileProgress.values.fold(0, (sum, progress) => sum + progress);
    return totalProgress / (_fileProgress.length * 100);
  }

  // Новый метод для парсинга тестовой строки
  void _parseTestFile() async {
    setState(() {
      _downloadStatus = 'Парсинг тестового файла...';
    });

    try {
      // Параметры для парсинга
      //final fileName = 'Datasheets_abilities.csv';
      //final csvRow = '000004186|7|||Nullstone Field Generator (Aura)|While a friendly <span class="kwb">NECRONS</span> unit is within 6" of the bearer, models in that unit have the Feel No Pain 5+ ability against mortal wounds and Psychic Attacks.|Wargear||';
      
      //_downloadService.tmpdownloadSingleCSV('Abilities.csv');

      // Вызов парсера с тестовой строкой
      //final csvString = '$csvRow\n'; // Добавляем новую строку для правильного формата CSV
      //final parsedData = _parserService.parseDatasheetAbilitiesFromCSV(csvString);
      
      // Показываем результат
      //_showParseResult(parsedData, csvRow);
      //print(CSVParserUtils.safeParseInt('6"'));
      
    } catch (e) {
      setState(() {
        _downloadStatus = 'Ошибка парсинга: $e';
      });
    }
  }

  // Метод для отображения результатов парсинга
 /* void _showParseResult(List<DatasheetAbility> parsedData, String originalRow) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Результат парсинга'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Оригинальная строка:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                originalRow,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  backgroundColor: Colors.black12,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Распарсенные данные:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (parsedData.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildParseRow('Datasheet ID:', parsedData.first.datasheetId.toString()),
                    _buildParseRow('line', parsedData.first.line.toString()),
                    _buildParseRow('abilityId:', parsedData.first.abilityId.toString()),
                    _buildParseRow('model:', parsedData.first.model.toString()),
                    _buildParseRow('name:', parsedData.first.name.toString()),
                    _buildParseRow('description:', parsedData.first.description.toString()),
                    _buildParseRow('type:', parsedData.first.type.toString()),
                    _buildParseRow('parameter:', parsedData.first.parameter.toString()),
                  ],
                )
              else
                const Text('Не удалось распарсить данные'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }*/

  // Метод проверки файлов
  Future<void> _checkForFilesToDelete() async {
   final hasFiles = await _cleanupService.hasDownloadedFiles();
   final fileSize = await _cleanupService.getFormattedFileSize();
  
   setState(() {
     _hasFilesToDelete = hasFiles;
     _totalFileSize = fileSize;
   });
 }

 // Метод удаления файлов
Future<void> _deleteAllFiles() async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Удаление файлов'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Вы уверены, что хотите удалить все загруженные файлы данных?'),
          const SizedBox(height: 8),
          Text(
            'Общий размер: $_totalFileSize',
            style: TextStyle(
              color: Colors.orange[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Это действие нельзя отменить. После удаления файлов потребуется повторная загрузка для работы с конструктором армий.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Отмена'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Удалить', style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
  
  if (!(confirmed ?? false)) return;
  
  setState(() {
    _downloadStatus = 'Удаление файлов...';
  });
  
  try {
    final result = await _cleanupService.deleteAllCSVFiles();
    
    if (result.success) {
      // Обновляем состояние приложения
      final appState = context.read<AppState>();
      appState.resetDownloadStatus();
      appState.lastDataUpdate = null;
      
      setState(() {
        _hasFilesToDelete = false;
        _totalFileSize = '0 Б';
        _successfulDownloads = 0;
        _failedDownloads = 0;
        _downloadStatus = 'Файлы успешно удалены!';
      });
      
      // Показываем результат удаления
      _showCleanupResult(result);
    } else {
      setState(() {
        _downloadStatus = 'Ошибка удаления: ${result.error}';
      });
    }
  } catch (e) {
    setState(() {
      _downloadStatus = 'Ошибка удаления: $e';
    });
  }
}

// Метод для отображения результата удаления
void _showCleanupResult(CleanupResult result) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        result.success ? 'Удаление завершено' : 'Ошибка удаления',
        style: TextStyle(
          color: result.success ? Colors.green : Colors.red,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(result.message),
            
            if (result.deletedFiles > 0) ...[
              const SizedBox(height: 16),
              const Text(
                'Удаленные файлы:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              ...result.deletedFileNames.map((fileName) => 
                Text('• $fileName')
              ),
            ],
            
            if (result.failedDeletions > 0) ...[
              const SizedBox(height: 16),
              Text(
                'Не удалось удалить (${result.failedDeletions}):',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              ...result.failedFileNames.map((fileName) => 
                Text('• $fileName', style: const TextStyle(color: Colors.red))
              ),
            ],
            
            const SizedBox(height: 16),
            Text(
              'Общий результат: ${result.deletedFiles}/${result.totalFiles} файлов',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

  /*Widget _buildParseRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }*/

  void _startDownload() async {
    setState(() {
      _isDownloading = true;
      _downloadComplete = false;
      _downloadStatus = 'Начало загрузки...';
      _fileProgress.clear();
      _fileResults.clear();
      _successfulDownloads = 0;
      _failedDownloads = 0;
      _errorMessage = null;
      _startTime = DateTime.now();
      _endTime = null;
    });

    try {
      final results = await _downloadService.downloadAllCSVFiles(
        onFileProgress: (fileName, progress) {
          setState(() {
            _fileProgress[fileName] = progress;
            _downloadStatus = 'Загружается: $fileName ($progress%)';
          });
        },
        onFileComplete: (fileName, success) {
          setState(() {
            _fileResults[fileName] = success;
            if (success) {
              _successfulDownloads++;
            } else {
              _failedDownloads++;
            }
          });
        },
      );

      _endTime = DateTime.now();
      
      // Обновляем состояние приложения
      final appState = context.read<AppState>();
      appState.lastDataUpdate = _endTime;

      setState(() {
        _isDownloading = false;
        _downloadComplete = true;
        _downloadStatus = 'Загрузка завершена!';
      });

      // Показываем итоговое уведомление
      await _checkForFilesToDelete();
      _showDownloadSummary(results);

    } catch (e) {
      setState(() {
        _isDownloading = false;
        _downloadComplete = false;
        _errorMessage = 'Ошибка загрузки: $e';
        print(_errorMessage);
        _endTime = DateTime.now();
      });
    }
  }

  void _showDownloadSummary(Map<String, DownloadResult> results) {
    final successful = results.values.where((r) => r.success).length;
    final failed = results.values.where((r) => !r.success).length;
    final duration = _downloadDuration;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Загрузка завершена'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Успешно загружено: $successful файлов'),
              if (failed > 0) Text('Не удалось загрузить: $failed файлов'),
              if (duration != null) Text('Время загрузки: ${duration.inSeconds} секунд'),
              const SizedBox(height: 16),
              if (failed > 0) ...[
                const Text('Ошибки загрузки:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                for (final entry in results.entries)
                  if (!entry.value.success)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('• ${entry.key}: ${entry.value.error}'),
                    ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _checkExistingFiles() async {
    setState(() {
      _downloadStatus = 'Проверка существующих файлов...';
    });

    try {
      final existingFiles = await _downloadService.checkAllFilesExist();
      final existingCount = existingFiles.values.where((exists) => exists).length;
      
      setState(() {
        _downloadStatus = 'Найдено файлов: $existingCount/${existingFiles.length}';
      });

      if (existingCount == existingFiles.length) {
        // Все файлы уже загружены
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Файлы уже загружены'),
              content: const Text('Все файлы данных уже загружены. Хотите загрузить их заново?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Отмена'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _startDownload();
                  },
                  child: const Text('Загрузить'),
                ),
              ],
            ),
          );
        });
      }
    } catch (e) {
      setState(() {
        _downloadStatus = 'Ошибка проверки файлов: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Автоматически проверяем существующие файлы при открытии экрана
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _checkExistingFiles();
      await _checkForFilesToDelete();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Загрузка данных'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
        if (_hasFilesToDelete)
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: 'Удалить все файлы',
            onPressed: _deleteAllFiles,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Статус обновления данных
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Статус данных',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (appState.lastDataUpdate != null)
                      Text('Последнее обновление: ${_formatDateTime(appState.lastDataUpdate!)}')
                    else
                      const Text('Данные еще не загружены'),
                    const SizedBox(height: 8),
                    Text(
                      'Загружено файлов: $_successfulDownloads',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Основная информация
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Загрузка файлов данных',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Приложение загрузит все необходимые файлы данных для работы с правилами Warhammer 40k.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _downloadStatus,
                      style: TextStyle(
                        color: _errorMessage != null ? Colors.red : Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Прогресс загрузки
            if (_isDownloading) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Прогресс загрузки',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Общий прогресс
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: _overallProgress,
                              backgroundColor: Colors.grey[300],
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text('${(_overallProgress * 100).toStringAsFixed(1)}%'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Прогресс по файлам
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200),
  child: SingleChildScrollView(
    child: Column(
      children: csvFiles.map((fileName) {
        final progress = _fileProgress[fileName] ?? 0;
        final isComplete = _fileResults[fileName] ?? false;
        final isFailed = _fileResults[fileName] == false;
        final fullUrl = '$csvBaseUrl$fileName';
        
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок с иконкой
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Иконка статуса
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, right: 8.0),
                    child: Icon(
                      isComplete ? Icons.check_circle : 
                      isFailed ? Icons.error : Icons.cloud_download,
                      size: 16,
                      color: isFailed ? Colors.red : 
                             isComplete ? Colors.green : Colors.blue,
                    ),
                  ),
                  // Текст
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          fullUrl,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // Процент
                  Text(
                    isComplete ? '100%' : 
                    isFailed ? 'Ошибка' : '$progress%',
                    style: TextStyle(
                      color: isFailed ? Colors.red : 
                             isComplete ? Colors.green : Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Прогресс бар
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.grey[200],
                color: isFailed ? Colors.red : 
                       isComplete ? Colors.green : Colors.blue,
              ),
            ],
          ),
        );
      }).toList(),
    ),
  ),
),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
            
            // Итоговая информация
            if (_downloadComplete && _downloadDuration != null) ...[
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 48),
                      const SizedBox(height: 16),
                      const Text(
                        'Загрузка завершена!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Успешно загружено: $_successfulDownloads файлов',
                        style: const TextStyle(fontSize: 16),
                      ),
                      if (_failedDownloads > 0)
                        Text(
                          'Ошибок: $_failedDownloads',
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        'Время загрузки: ${_downloadDuration!.inSeconds} секунд',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
            
            const Spacer(),
            
            // Кнопка загрузки
            ElevatedButton.icon(
              onPressed: _isDownloading ? null : _startDownload,
              icon: Icon(
                _isDownloading ? Icons.pause : Icons.cloud_download,
                size: 24,
              ),
              label: Text(
                _isDownloading ? 'Загрузка...' : 'Загрузить все файлы',
                style: const TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: _isDownloading ? Colors.grey : Colors.blue,
              ),
            ),
            
            const SizedBox(height: 8),

            // Кнопка удаления файлов (если есть что удалять)
          if (_hasFilesToDelete)
            OutlinedButton.icon(
              onPressed: _isDownloading ? null : _deleteAllFiles,
              icon: const Icon(Icons.delete_outline, size: 20),
              label: const Text(
                'Удалить все файлы',
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          
          const SizedBox(height: 8),

            // Новая кнопка для тестового парсинга
            OutlinedButton.icon(
              onPressed: _isDownloading ? null : _parseTestFile,
              icon: const Icon(Icons.code, size: 20),
              label: const Text('Тест парсера (Datasheets_abilities)'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
                side: const BorderSide(color: Colors.purple),
              )
            ),
            // Кнопка проверки
            OutlinedButton.icon(
              onPressed: _isDownloading ? null : _checkExistingFiles,
              icon: const Icon(Icons.search, size: 20),
              label: const Text('Проверить существующие файлы'),
            ),
          ],
        ),
      ),
    );
  }
  
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}