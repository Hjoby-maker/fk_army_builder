// lib/screens/builder_screen.dart (основная часть)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals/app_state.dart';
import '../screens/widgets/collapsible_section.dart';
import '../screens/widgets/unit_list_item.dart';
import '../screens/widgets/unit_selection_dialog.dart';
import '../screens/widgets/unit_detail_popup.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  // Данные для каждой из 7 секций
  final Map<String, Set<int>> _selectedUnits = {
    'Лидеры': {},
    'Элита': {},
    'Бойцы': {},
    'Поддержка': {},
    'Транспорт': {},
    'Укрепления': {},
    'Дополнительно': {},
  };

  // Временные данные для демонстрации (замените на загрузку из БД)
  final Map<String, List<UnitOption>> _availableUnits = {
    'Лидеры': [
      UnitOption(
          id: 1,
          name: 'Капитан в силовой броне',
          cost: 85,
          description: 'Лидер отряда ближнего боя'),
      UnitOption(
          id: 2,
          name: 'Либрариус',
          cost: 100,
          description: 'Псайкер с мощными способностями'),
      UnitOption(
          id: 3, name: 'Чаплейн', cost: 90, description: 'Боевой священник'),
    ],
    'Элита': [
      UnitOption(
          id: 10,
          name: 'Отряд терминаторов',
          cost: 35,
          description: '5 моделей, тяжелая броня'),
      UnitOption(
          id: 11,
          name: 'Агрессоры',
          cost: 40,
          description: '3 модели, огневая поддержка'),
    ],
    'Бойцы': [
      UnitOption(
          id: 20,
          name: 'Тактический отряд',
          cost: 17,
          description: '5-10 моделей, универсальные'),
      UnitOption(
          id: 21,
          name: 'Интерцессоры',
          cost: 20,
          description: '5 моделей, улучшенное вооружение'),
    ],
    'Поддержка': [],
    'Транспорт': [],
    'Укрепления': [],
    'Дополнительно': [],
  };

  int get _totalPoints {
    int sum = 0;
    for (final section in _availableUnits.keys) {
      for (final unit in _availableUnits[section]!) {
        if (_selectedUnits[section]!.contains(unit.id)) {
          sum += unit.cost;
        }
      }
    }
    return sum;
  }

  void _showUnitSelector(String category) {
    final units = _availableUnits[category] ?? [];

    showDialog(
      context: context,
      builder: (context) => UnitSelectionDialog(
        title: category,
        units: units,
        selectedIds: _selectedUnits[category]!,
        onToggleSelect: (id, selected) {
          setState(() {
            if (selected) {
              _selectedUnits[category]!.add(id);
            } else {
              _selectedUnits[category]!.remove(id);
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final maxPoints = appState.currentMaxPoints ?? 2000;
    final isOverLimit = _totalPoints > maxPoints;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Конструктор армии'),
        backgroundColor: const Color.fromARGB(255, 136, 2, 2),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isOverLimit
                  ? Colors.red.withOpacity(0.3)
                  : Colors.green.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bolt, size: 18, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  '$_totalPoints / $maxPoints',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF473B15),
              Color.fromARGB(255, 132, 105, 17),
              Color.fromARGB(255, 171, 133, 7),
            ],
          ),
        ),
        child: Column(
          children: [
            // Заголовок с информацией
            _buildHeader(appState.currentFaction! ?? 'Не выбрана'),

            // 7 сворачиваемых секций
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildSection('Лидеры'),
                  _buildSection('Элита'),
                  _buildSection('Бойцы'),
                  _buildSection('Поддержка'),
                  _buildSection('Транспорт'),
                  _buildSection('Укрепления'),
                  _buildSection('Дополнительно'),
                ],
              ),
            ),

            // Кнопки действий
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String factionName) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black12,
      child: Column(
        children: [
          Text(
            factionName,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoChip('Юнитов', '${_getTotalSelectedCount()}'),
              const SizedBox(width: 8),
              _buildInfoChip('Очки', '$_totalPoints'),
            ],
          ),
        ],
      ),
    );
  }

  int _getTotalSelectedCount() {
    return _selectedUnits.values.fold(0, (sum, set) => sum + set.length);
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$label: ',
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    final selectedCount = _selectedUnits[title]?.length ?? 0;
    final units = _selectedUnits[title]!
        .map((id) => _availableUnits[title]?.firstWhere((u) => u.id == id))
        .whereType<UnitOption>()
        .toList();

    return CollapsibleSection(
      title: title,
      itemCount: _availableUnits[title]?.length ?? 0,
      selectedCount: selectedCount,
      onAddPressed: () => _showUnitSelector(title),
      children: units.isEmpty
          ? [
              const Text(
                'Нет выбранных юнитов. Нажмите + чтобы добавить.',
                style: TextStyle(
                    color: Colors.white70, fontStyle: FontStyle.italic),
              ),
            ]
          : units
              .map((unit) => UnitListItem(
                    name: unit.name,
                    cost: unit.cost,
                    description: unit.description,
                    isSelected: true,
                    onSelectPressed: () {
                      // Удалить выбранный юнит
                      setState(() {
                        _selectedUnits[title]!.remove(unit.id);
                      });
                    },
                    onInfoPressed: () => showDialog(
                      context: context,
                      builder: (ctx) => UnitDetailPopup(unit: unit),
                    ),
                  ))
              .toList(),
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (_totalPoints >
              (context.read<AppState>().currentMaxPoints ?? 2000))
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.5)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Превышен лимит очков!',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      for (final key in _selectedUnits.keys) {
                        _selectedUnits[key]!.clear();
                      }
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.amber),
                    minimumSize: const Size(0, 48),
                  ),
                  child: const Text('Очистить'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _totalPoints > 0 ? _saveArmy : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(0, 48),
                  ),
                  child: const Text('Сохранить'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _saveArmy() {
    // TODO: Сохранение в БД через AppState
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Армия сохранена!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
