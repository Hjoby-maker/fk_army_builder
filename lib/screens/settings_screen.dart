import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _urlController = TextEditingController();
  bool _isCheckingUrl = false;
  bool _isUrlValid = false;
  String _urlStatusMessage = '';
  Color _urlStatusColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _loadSavedUrl();
  }

  Future<void> _loadSavedUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUrl = prefs.getString('csv_download_url');
    
    if (savedUrl != null && savedUrl.isNotEmpty) {
      _urlController.text = savedUrl;
      setState(() {
        _isUrlValid = true;
        _urlStatusMessage = 'URL загружен из настроек';
        _urlStatusColor = Colors.blue;
      });
    }
  }

  Future<void> _checkUrlAvailability() async {
    if (_urlController.text.isEmpty) {
      setState(() {
        _urlStatusMessage = 'Введите URL адрес';
        _urlStatusColor = Colors.orange;
      });
      return;
    }

    setState(() {
      _isCheckingUrl = true;
      _urlStatusMessage = 'Проверка доступности URL...';
      _urlStatusColor = Colors.blue;
    });

    try {
      // Проверяем, что URL начинается с http:// или https://
      final url = _urlController.text.trim();
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        throw Exception('URL должен начинаться с http:// или https://');
      }

      // Имитация проверки URL (в реальном приложении здесь будет HTTP запрос)
      await Future.delayed(const Duration(seconds: 1));

      // Простая проверка формата URL
      final uri = Uri.tryParse(url);
      if (uri == null || !uri.hasAbsolutePath) {
        throw Exception('Некорректный формат URL');
      }

      setState(() {
        _isUrlValid = true;
        _urlStatusMessage = 'URL доступен и корректен ✓';
        _urlStatusColor = Colors.green;
      });
    } catch (e) {
      setState(() {
        _isUrlValid = false;
        _urlStatusMessage = 'Ошибка: ${e.toString().replaceAll('Exception: ', '')}';
        _urlStatusColor = Colors.red;
      });
    } finally {
      setState(() {
        _isCheckingUrl = false;
      });
    }
  }

  Future<void> _saveUrl() async {
    if (!_isUrlValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сначала проверьте URL на доступность'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('csv_download_url', _urlController.text.trim());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('URL успешно сохранен'),
        backgroundColor: Colors.green,
      ),
    );

    // Можно вернуться назад или обновить состояние
    Navigator.pop(context);
  }

  void _resetToDefault() {
    _urlController.text = 'http://wahapedia.ru/wh40k10ed/Factions.csv';
    setState(() {
      _isUrlValid = true;
      _urlStatusMessage = 'Установлен URL по умолчанию';
      _urlStatusColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки приложения'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок секции
            const Text(
              'Настройки загрузки данных',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Укажите URL адрес для загрузки CSV файла с данными фракций',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 24),

            // Поле ввода URL
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'URL адрес CSV файла',
                hintText: 'http://example.com/data.csv',
                prefixIcon: const Icon(Icons.link),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) {
                setState(() {
                  _isUrlValid = false;
                  _urlStatusMessage = '';
                });
              },
            ),
            const SizedBox(height: 16),

            // Статус URL
            if (_urlStatusMessage.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _urlStatusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _urlStatusColor.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(
                      _isUrlValid ? Icons.check_circle : Icons.info,
                      color: _urlStatusColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _urlStatusMessage,
                        style: TextStyle(
                          color: _urlStatusColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 24),

            // Кнопки действий
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isCheckingUrl ? null : _checkUrlAvailability,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: _isCheckingUrl
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Icon(Icons.search, size: 20),
                    label: Text(
                      _isCheckingUrl ? 'Проверка...' : 'Проверить URL',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isUrlValid ? _saveUrl : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.save, size: 20),
                    label: const Text(
                      'Сохранить настройки',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: _resetToDefault,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.restore, size: 20),
              label: const Text('Восстановить URL по умолчанию'),
            ),

            // Разделитель
            const Divider(height: 40),
            
            // Дополнительные настройки
            const Text(
              'Дополнительные настройки',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            // Автоматическая проверка обновлений
            SwitchListTile(
              title: const Text('Автоматическая проверка обновлений данных'),
              subtitle: const Text('При запуске приложения'),
              value: true,
              onChanged: (value) {},
              secondary: const Icon(Icons.update, color: Colors.blue),
            ),

            // Кэширование данных
            SwitchListTile(
              title: const Text('Кэширование загруженных данных'),
              subtitle: const Text('Сохранение данных для офлайн-режима'),
              value: true,
              onChanged: (value) {},
              secondary: const Icon(Icons.storage, color: Colors.blue),
            ),

            // О приложении
            const SizedBox(height: 40),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'О приложении',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const ListTile(
                      leading: Icon(Icons.info, color: Colors.blue),
                      title: Text('Версия приложения'),
                      subtitle: Text('1.0.0'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.book, color: Colors.blue),
                      title: Text('Редакция правил Warhammer 40k'),
                      subtitle: Text('10th Edition'),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          // Можно добавить экран с лицензией
                        },
                        icon: const Icon(Icons.description),
                        label: const Text('Лицензионное соглашение'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
}