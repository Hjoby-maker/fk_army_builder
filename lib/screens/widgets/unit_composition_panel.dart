// lib/screens/widgets/unit_composition_panel.dart
import 'package:fk_army_builder/models/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/queries/cross_table_queries.dart';
import '../../globals/app_state.dart';
import 'unit_composition_editor.dart'; // Добавьте этот импорт

class UnitCompositionPanel extends StatefulWidget {
  final UnitSummary unit;
  final int instanceId; // для идентификации конкретного экземпляра
  final String sectionTitle; // секция, из которой пришел юнит

  const UnitCompositionPanel({
    super.key,
    required this.unit,
    required this.instanceId,
    required this.sectionTitle,
  });

  @override
  State<UnitCompositionPanel> createState() => _UnitCompositionPanelState();
}

class _UnitCompositionPanelState extends State<UnitCompositionPanel> {
  late bool _isWarlord;

  // Проверяем, является ли юнит персонажем (Characters или Epic Hero)
  bool get _isCharacter {
    return widget.sectionTitle == 'Characters' ||
        widget.sectionTitle == 'Epic Hero';
  }

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    // Проверяем, является ли этот конкретный экземпляр варлордом
    // Для уникальности используем комбинацию ID юнита и instanceId
    _isWarlord = appState.warlordUnitId == widget.unit.datasheet.id;
  }

  // ⬇️ ПЕРЕМЕЩАЕМ ФУНКЦИЮ ВНУТРЬ КЛАССА
  Future<UnitComposition?> _loadComposition() async {
    final appState = Provider.of<AppState>(context, listen: false);
    final db = appState.databaseService.database;
    final queries = CrossTableQueries(db);

    return await queries.getUnitComposition(widget.unit.datasheet.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок с информацией о составе
        const Text(
          'Unit Composition:',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),

        // FutureBuilder для загрузки композиции
        FutureBuilder<UnitComposition?>(
          future: _loadComposition(), // ← теперь функция доступна
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(color: Colors.amber),
                ),
              );
            }

            if (snapshot.hasError) {
              print('Error loading composition: ${snapshot.error}');
              return Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Error loading composition: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No composition data available',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            final composition = snapshot.data!;

            return Column(
              children: [
                // Список моделей в составе (из costs)
                if (widget.unit.costs.isNotEmpty)
                  ...widget.unit.costs.map((cost) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              cost.description ?? 'Model ${cost.line}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            '${cost.cost} pts',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                const SizedBox(height: 16),

                // Редактор состава
                UnitCompositionEditor(
                  composition: composition,
                  onChanged: (selectedCounts) {
                    // Здесь можно обновлять стоимость юнита в AppState
                    print('Selected counts: $selectedCounts');
                  },
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 16),

        // Секция Warlord (только для персонажей)
        if (_isCharacter) ...[
          const Divider(color: Colors.amber),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    _isWarlord ? Colors.amber : Colors.amber.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                // Чекбокс для выбора Warlord
                Checkbox(
                  value: _isWarlord,
                  onChanged: (value) {
                    setState(() {
                      _isWarlord = value ?? false;
                      final appState =
                          Provider.of<AppState>(context, listen: false);

                      if (_isWarlord) {
                        // Устанавливаем этого юнита как варлорда
                        appState.setWarlord(widget.unit.datasheet.id);
                      } else {
                        // Если снимаем галочку, сбрасываем варлорда
                        // Но только если этот юнит был варлордом
                        if (appState.warlordUnitId ==
                            widget.unit.datasheet.id) {
                          appState.setWarlord(null);
                        }
                      }
                    });
                  },
                  activeColor: Colors.amber,
                  checkColor: Colors.black,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Warlord',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Make this character the Warlord of your army',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Иконка короны для визуального подтверждения
                if (_isWarlord)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.emoji_events,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),

          // Информационное сообщение если выбран другой варлорд
          Consumer<AppState>(
            builder: (context, appState, child) {
              if (appState.warlordUnitId != null &&
                  appState.warlordUnitId != widget.unit.datasheet.id &&
                  _isCharacter) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    'Note: Another unit is already selected as Warlord',
                    style: TextStyle(
                      color: Colors.amber.shade300,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ],
    );
  }
}
