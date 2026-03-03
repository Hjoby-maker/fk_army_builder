// lib/screens/widgets/points_dialog.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../globals/app_state.dart';

class PointsDialog extends StatefulWidget {
  const PointsDialog({super.key});

  @override
  State<PointsDialog> createState() => _PointsDialogState();
}

class _PointsDialogState extends State<PointsDialog> {
  late int _selectedPoints;
  late TextEditingController _customController;
  bool _isCustomSelected = false;

  final List<int> _presetPoints = [1000, 1500, 2000];

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    _selectedPoints = appState.currentMaxPoints ?? 2000;
    _customController = TextEditingController(text: _selectedPoints.toString());

    // Проверяем, является ли текущее значение предустановленным
    _isCustomSelected = !_presetPoints.contains(_selectedPoints);
  }

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  void _updatePoints(int points) {
    setState(() {
      _selectedPoints = points;
      _customController.text = points.toString();
      _isCustomSelected = !_presetPoints.contains(points);
    });
  }

  void _saveAndClose() {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.updateMaxPoints(_selectedPoints);
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
          maxHeight: MediaQuery.of(context).size.height * 0.6,
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
                  const Icon(Icons.track_changes, color: Colors.amber),
                  const SizedBox(width: 8),
                  const Text(
                    'Points Limit',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select army points limit:',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Radio buttons для предустановленных значений
                    ..._presetPoints.map((points) => _buildRadioTile(
                          value: points,
                          title: '$points pts',
                        )),

                    const Divider(color: Colors.amber, height: 32),

                    // Поле для произвольного значения
                    const Text(
                      'Custom points:',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // Radio для кастомного значения
                        Radio<int>(
                          value: _selectedPoints,
                          groupValue: _selectedPoints,
                          onChanged: (value) {
                            // Если радио не выбрано, выбираем его
                            if (!_isCustomSelected) {
                              final customValue =
                                  int.tryParse(_customController.text);
                              if (customValue != null && customValue <= 2000) {
                                _updatePoints(customValue);
                              }
                            }
                          },
                          activeColor: Colors.amber,
                        ),

                        // Поле ввода
                        Expanded(
                          child: TextField(
                            controller: _customController,
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter points (max 2000)',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.amber.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.amber,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixText: 'pts',
                              suffixStyle: const TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                            onChanged: (value) {
                              final points = int.tryParse(value);
                              if (points != null && points <= 2000) {
                                _updatePoints(points);
                              }
                            },
                          ),
                        ),
                      ],
                    ),

                    if (_selectedPoints > 2000)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 40),
                        child: Text(
                          'Maximum points is 2000',
                          style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(height: 24),

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
                          onPressed:
                              _selectedPoints <= 2000 ? _saveAndClose : null,
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

  Widget _buildRadioTile({required int value, required String title}) {
    return RadioListTile<int>(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      value: value,
      groupValue: _selectedPoints,
      onChanged: (selectedValue) {
        if (selectedValue != null) {
          _updatePoints(selectedValue);
        }
      },
      activeColor: Colors.amber,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
