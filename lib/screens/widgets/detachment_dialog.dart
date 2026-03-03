// lib/screens/widgets/detachment_dialog.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../globals/app_state.dart';
import '../../database/queries/cross_table_queries.dart';

class DetachmentDialog extends StatefulWidget {
  const DetachmentDialog({super.key});

  @override
  State<DetachmentDialog> createState() => _DetachmentDialogState();
}

class _DetachmentDialogState extends State<DetachmentDialog> {
  List<DropdownMenuItem<int>> _detachmentItems = [];
  int? _selectedDetachmentId;
  String? _selectedDetachmentName;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDetachments();
  }

  Future<void> _loadDetachments() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final appState = Provider.of<AppState>(context, listen: false);
      final factionId = appState.currentFactionId;

      if (factionId == null || factionId.isEmpty) {
        setState(() {
          _error = 'Фракция не выбрана';
          _isLoading = false;
        });
        return;
      }

      // Получаем экземпляр базы данных
      final db = appState.databaseService.database;
      final queries = CrossTableQueries(db);

      // Загружаем детачменты для фракции
      final detachments = await queries.getDetachmentsByFaction(factionId);

      // Сохраняем текущий выбранный детачмент
      _selectedDetachmentId = appState.currentDetachmentId;

      // Создаем элементы для выпадающего списка
      _detachmentItems = detachments.map((detachment) {
        return DropdownMenuItem<int>(
          value: detachment.id,
          child: Text(
            detachment.name,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList();

      // Добавляем пустой элемент для сброса выбора
      _detachmentItems.insert(
          0,
          const DropdownMenuItem<int>(
            value: -1,
            child: Text(
              'None',
              style:
                  TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
            ),
          ));

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Ошибка загрузки: $e';
        _isLoading = false;
      });
    }
  }

  void _saveAndClose() {
    final appState = Provider.of<AppState>(context, listen: false);

    if (_selectedDetachmentId != null && _selectedDetachmentId! > 0) {
      appState.updateDetachment(
        detachmentName: _selectedDetachmentName,
        detachmentId: _selectedDetachmentId,
      );
    } else {
      // Если выбран "None", сбрасываем детачмент
      appState.updateDetachment(
        detachmentName: null,
        detachmentId: null,
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 136, 2, 2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_tree,
                      color: Colors.amber), // Изменили иконку
                  const SizedBox(width: 8),
                  const Text(
                    'Select Detachment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Контент
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _isLoading
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: Colors.amber),
                            SizedBox(height: 16),
                            Text(
                              'Loading detachments...',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      )
                    : _error != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red[300],
                                size: 48,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _error!,
                                style: const TextStyle(color: Colors.white70),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: _loadDetachments,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text('Retry'),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Choose detachment for your army:',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Выпадающий список
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.amber.withOpacity(0.3),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: _selectedDetachmentId ?? -1,
                                    isExpanded: true,
                                    dropdownColor:
                                        const Color.fromARGB(255, 45, 45, 45),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.amber,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    items: _detachmentItems,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedDetachmentId = value;
                                        if (value != null && value > 0) {
                                          // Находим название выбранного детачмента
                                          final item =
                                              _detachmentItems.firstWhere(
                                            (item) => item.value == value,
                                          );
                                          _selectedDetachmentName =
                                              (item.child as Text).data;
                                        } else {
                                          _selectedDetachmentName = null;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),

                              const Spacer(),

                              // Кнопки действий
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white70,
                                    ),
                                    child: const Text('Cancel'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: _saveAndClose,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.black,
                                    ),
                                    child: const Text('Save'),
                                  ),
                                ],
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
}
