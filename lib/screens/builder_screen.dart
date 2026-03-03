// lib/screens/builder_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals/app_state.dart';
import '../screens/widgets/collapsible_section.dart';
import '../screens/widgets/unit_list_item.dart';
import '../screens/widgets/unit_selection_dialog.dart';
import '../screens/widgets/unit_detail_popup.dart';
import '../screens/widgets/bottom_nav_bar.dart';
import '../database/queries/cross_table_queries.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  int _selectedIndex = 1;

  late CrossTableQueries _queries;
  List<UnitSummary> _units = [];
  Set<String> _selectedKeywords = {};

  bool _isLoading = false;
  String? _error;

  // 🔹 Новая структура для хранения выбранных юнитов с количеством
  // Map<Название секции, Map<ID юнита, количество>>
  final Map<String, Map<int, int>> _selectedUnitsWithQuantity = {
    'Epic Hero': {},
    'Characters': {},
    'Battleline': {},
    'Infantry': {},
    'Vehicle': {},
    'Dedicated Transports': {},
    'Fortifications': {},
  };

  // Для обратной совместимости с существующим кодом
  // Получаем Set ID выбранных юнитов (уникальные ID)
  Map<String, Set<int>> get _selectedUnits {
    final result = <String, Set<int>>{};
    _selectedUnitsWithQuantity.forEach((section, quantityMap) {
      result[section] = quantityMap.keys.toSet();
    });
    return result;
  }

  final Map<String, String> _roleToSection = {
    'Epic Hero': 'Epic Hero',
    'Characters': 'Characters',
    'Battleline': 'Battleline',
    'Infantry': 'Infantry',
    'Vehicle': 'Vehicle',
    'Dedicated Transports': 'Dedicated Transports',
    'Fortifications': 'Fortifications',
  };

  final List<String> _sections = const [
    'Epic Hero',
    'Characters',
    'Battleline',
    'Infantry',
    'Vehicle',
    'Dedicated Transports',
    'Fortifications',
  ];

  @override
  void initState() {
    super.initState();
    _initService();
  }

  void _initService() {
    final appState = Provider.of<AppState>(context, listen: false);
    final db = appState.databaseService.database;
    _queries = CrossTableQueries(db);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final appState = Provider.of<AppState>(context, listen: false);
    final factionId = appState.currentFactionId;

    if (factionId == null || factionId.isEmpty) {
      setState(() => _error = 'Фракция не выбрана');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      // _currentFactionId = factionId;
    });

    try {
      final results = await Future.wait([
        _queries.getUnitsSummaryByFaction(
          factionId: factionId,
          keywordFilter:
              _selectedKeywords.isNotEmpty ? _selectedKeywords.toList() : null,
        ),
        _queries.getUniqueKeywordsByFaction(factionId),
      ]);

      setState(() {
        _units = results[0] as List<UnitSummary>;
        //  _availableKeywords = results[1] as List<String>;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Ошибка загрузки: ${e.toString()}';
        _isLoading = false;
      });
      print('❌ BuilderScreen error: $e');
    }
  }

  void _clearFilters() {
    setState(() => _selectedKeywords.clear());
    _loadData();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }

  /// Общая сумма очков с учетом количества
  int get _totalPoints {
    int sum = 0;
    for (final unit in _units) {
      for (final section in _selectedUnitsWithQuantity.values) {
        final quantity = section[unit.datasheet.id];
        if (quantity != null && quantity > 0) {
          sum += (unit.minCost ?? 0) * quantity;
          break;
        }
      }
    }
    return sum;
  }

  /// Общее количество выбранных юнитов (с учетом количества)
  int _getTotalSelectedCount() {
    int total = 0;
    for (final quantityMap in _selectedUnitsWithQuantity.values) {
      for (final quantity in quantityMap.values) {
        total += quantity;
      }
    }
    return total;
  }

  /// Количество выбранных юнитов в конкретной секции (с учетом количества)
  int _getSelectedCountForSection(String section) {
    final quantityMap = _selectedUnitsWithQuantity[section] ?? {};
    return quantityMap.values.fold(0, (sum, qty) => sum + qty);
  }

  /// Получаем количество доступных юнитов в секции
  int _getAvailableCountForSection(String section) {
    if (_units.isEmpty) return 0;
    return _units.where((unit) => _getUnitSection(unit) == section).length;
  }

  /// Получаем выбранные юниты для секции
  List<UnitSummary> _getSelectedUnitsForSection(String section) {
    if (_units.isEmpty) return [];

    final quantityMap = _selectedUnitsWithQuantity[section] ?? {};
    final result = <UnitSummary>[];

    for (final unit in _units) {
      final quantity = quantityMap[unit.datasheet.id];
      if (quantity != null && quantity > 0) {
        // Добавляем юнит в список нужное количество раз
        for (int i = 0; i < quantity; i++) {
          result.add(unit);
        }
      }
    }

    return result;
  }

  /// Получаем юниты для конкретной секции (для диалога выбора)
  List<UnitSummary> _getUnitsForSection(String section) {
    if (_units.isEmpty) return [];
    return _units.where((unit) => _getUnitSection(unit) == section).toList();
  }

  /// Обновленный метод показа диалога выбора
  void _showUnitSelector(String category) {
    print('📱 Открыта категория: $category');
    final availableUnits = _getUnitsForSection(category);

    if (availableUnits.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('В разделе "$category" нет доступных юнитов'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Получаем текущие выбранные ID для этой секции
    final currentSelectedIds = _selectedUnitsWithQuantity[category]!
        .entries
        .where((e) => e.value > 0)
        .map((e) => e.key)
        .toSet();

    showDialog(
      context: context,
      builder: (context) => UnitSelectionDialog(
        title: category,
        units: availableUnits,
        selectedIds: currentSelectedIds,
        onToggleSelect: (id, selected) {
          setState(() {
            if (selected) {
              // Для уникальных секций просто добавляем
              // Для массовых секций диалог сам управляет количеством
              _selectedUnitsWithQuantity[category]![id] = 1;
            } else {
              _selectedUnitsWithQuantity[category]!.remove(id);
            }
          });
        },
        onQuantityChange: (id, quantity) {
          // Новый колбэк для обновления количества
          setState(() {
            if (quantity > 0) {
              _selectedUnitsWithQuantity[category]![id] = quantity;
            } else {
              _selectedUnitsWithQuantity[category]!.remove(id);
            }
          });
        },
      ),
    );
  }

  void _saveArmy() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Армия сохранена!'),
        backgroundColor: Colors.green,
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
          if (_selectedKeywords.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: _clearFilters,
            ),
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
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
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
            _buildFactionHeader(appState),
            Expanded(
              child: _buildSectionsList(),
            ),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildFactionHeader(AppState appState) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.black26,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appState.currentArmyName ?? 'Новая армия',
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  appState.currentFaction ?? 'Фракция не выбрана',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withOpacity(0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${_getTotalSelectedCount()}',
                  style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(width: 4),
                const Text('юн.',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ⚠️ ВАЖНО: Всегда строим список всех 7 секций
  Widget _buildSectionsList() {
    // Если идет загрузка, показываем индикатор поверх секций
    if (_isLoading) {
      return Stack(
        children: [
          // Фоновые секции (полупрозрачные)
          _buildSectionsContent(),
          // Затемняющий слой с индикатором
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.amber),
                  SizedBox(height: 16),
                  Text('Загрузка юнитов...',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // Если ошибка, показываем сообщение об ошибке
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red[300], size: 48),
            const SizedBox(height: 12),
            Text(
              _error!,
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }

    // В обычном состоянии показываем секции
    return _buildSectionsContent();
  }

  /// Строит контент секций
  Widget _buildSectionsContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: _sections.map((section) {
        return _buildSection(section);
      }).toList(),
    );
  }

  Widget _buildSection(String title) {
    final selectedUnits = _getSelectedUnitsForSection(title);
    final availableCount = _getAvailableCountForSection(title);

    return CollapsibleSection(
      title: title,
      itemCount: availableCount,
      selectedCount: selectedUnits.length,
      onAddPressed: () => _showUnitSelector(title),
      children: selectedUnits.isEmpty
          ? [
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  availableCount == 0
                      ? 'В этой категории нет доступных юнитов'
                      : 'Нет выбранных юнитов. Нажмите + чтобы добавить.',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]
          : _buildUnitListWithQuantities(selectedUnits, title),
    );
  }

  /// Строит список юнитов с учетом количества
  List<Widget> _buildUnitListWithQuantities(
      List<UnitSummary> units, String sectionTitle) {
    final Map<int, int> quantities = {};
    for (final unit in units) {
      quantities[unit.datasheet.id] = (quantities[unit.datasheet.id] ?? 0) + 1;
    }

    final result = <Widget>[];
    for (final unit in units) {
      final id = unit.datasheet.id;
      if (quantities.containsKey(id)) {
        final quantity = quantities[id]!;
        result.add(
          UnitListItem(
            name: unit.datasheet.name,
            cost: unit.minCost ?? 0,
            description: unit.keywordsString,
            quantity: quantity, // Новый параметр для отображения количества
            isSelected: true,
            onSelectPressed: () {
              setState(() {
                _selectedUnitsWithQuantity[sectionTitle]!.remove(id);
              });
            },
            onInfoPressed: () => showDialog(
              context: context,
              builder: (ctx) => UnitDetailPopup(unit: unit),
            ),
          ),
        );
        quantities.remove(id); // Убираем, чтобы не дублировать
      }
    }
    return result;
  }

  Widget _buildBottomActions() {
    final maxPoints = context.read<AppState>().currentMaxPoints ?? 2000;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        border: const Border(
          top: BorderSide(color: Colors.amber, width: 0.5),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_totalPoints > maxPoints)
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

  String _getUnitSection(UnitSummary unit) {
    final keywords = unit.keywords.map((k) => k.keyword?.toLowerCase()).toSet();

    final _unit = unit.datasheet.role?.toLowerCase();

    if (_unit == 'characters') {
      if (keywords.contains('epic hero')) {
        return 'Epic Hero';
      }
    }
    if (_unit == 'other') {
      if (keywords.contains('infantry')) {
        return 'Infantry';
      }
      if (keywords.contains('vehicle')) {
        return 'Vehicle';
      }
    }
    return _roleToSection[unit.datasheet.role] ?? 'Дополнительно';
    //if (!unit.hasCost) return 'Дополнительно';
  }
}
