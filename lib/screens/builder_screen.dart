// lib/screens/builder_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals/app_state.dart';
import '../screens/widgets/collapsible_section.dart';
import '../screens/widgets/unit_list_item.dart';
import '../screens/widgets/unit_selection_dialog.dart';
import '../screens/widgets/unit_detail_popup.dart';
import '../screens/widgets/bottom_nav_bar.dart';
import '../database/database.dart';
import '../database/queries/cross_table_queries.dart';
import '../models/index.dart' as models;

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  int _selectedIndex = 1;

  late CrossTableQueries _queries;
  List<UnitSummary> _units = [];
  List<String> _availableKeywords = [];
  Set<String> _selectedKeywords = {};

  bool _isLoading = false;
  String? _error;
  String? _currentFactionId;

  // 🔹 Всегда показываем эти 7 секций
  final Map<String, Set<int>> _selectedUnits = {
    'Лидеры': {},
    'Элита': {},
    'Бойцы': {},
    'Поддержка': {},
    'Транспорт': {},
    'Укрепления': {},
    'Дополнительно': {},
  };

  final Map<String, String> _roleToSection = {
    'Leader': 'Лидеры',
    'Elite': 'Элита',
    'Troops': 'Бойцы',
    'Support': 'Поддержка',
    'Transport': 'Транспорт',
    'Fortification': 'Укрепления',
    'Other': 'Дополнительно',
  };

  final List<String> _sections = const [
    'Лидеры',
    'Элита',
    'Бойцы',
    'Поддержка',
    'Транспорт',
    'Укрепления',
    'Дополнительно',
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
      _currentFactionId = factionId;
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
        _availableKeywords = results[1] as List<String>;
        _isLoading = false;
      });

      print('✅ Загружено юнитов: ${_units.length}');
    } catch (e, stack) {
      setState(() {
        _error = 'Ошибка загрузки: ${e.toString()}';
        _isLoading = false;
      });
      print('❌ BuilderScreen error: $e');
    }
  }

  void _toggleKeywordFilter(String keyword) {
    setState(() {
      if (_selectedKeywords.contains(keyword)) {
        _selectedKeywords.remove(keyword);
      } else {
        _selectedKeywords.add(keyword);
      }
    });
    _loadData();
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

  int get _totalPoints {
    int sum = 0;
    for (final unit in _units) {
      for (final section in _selectedUnits.values) {
        if (section.contains(unit.datasheet.id)) {
          sum += unit.minCost ?? 0;
          break;
        }
      }
    }
    return sum;
  }

  int _getTotalSelectedCount() {
    return _selectedUnits.values.fold(0, (sum, set) => sum + set.length);
  }

  /// Получаем количество доступных юнитов в секции
  int _getAvailableCountForSection(String section) {
    int count = 0;
    for (final unit in _units) {
      if (!unit.hasCost) continue;
      final role = unit.datasheet.role ?? 'Other';
      final sectionName = _roleToSection[role] ?? 'Дополнительно';
      if (sectionName == section) {
        count++;
      }
    }
    return count;
  }

  /// Получаем выбранные юниты для секции
  List<UnitSummary> _getSelectedUnitsForSection(String section) {
    final selectedIds = _selectedUnits[section] ?? {};
    return _units
        .where((unit) => selectedIds.contains(unit.datasheet.id))
        .toList();
  }

  void _showUnitSelector(String category) {
    // Собираем все юниты, подходящие для этой секции
    final availableUnits = _units.where((unit) {
      if (!unit.hasCost) return false;
      final role = unit.datasheet.role ?? 'Other';
      final sectionName = _roleToSection[role] ?? 'Дополнительно';
      return sectionName == category;
    }).toList();

    if (availableUnits.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('В разделе "$category" нет доступных юнитов'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => UnitSelectionDialog(
        title: category,
        units: availableUnits,
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

            if (_availableKeywords.isNotEmpty && !_isLoading)
              _buildKeywordFilters(),

            // ⚠️ ВАЖНО: Здесь всегда показываем список секций
            Expanded(
              child: _isLoading
                  ? _buildLoadingIndicator()
                  : _error != null
                      ? _buildErrorWidget()
                      : _buildSectionsList(), // ← Всегда показываем секции, даже если _units пустой
            ),

            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.amber),
          SizedBox(height: 16),
          Text('Загрузка юнитов...', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
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

  Widget _buildKeywordFilters() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.black12,
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: _availableKeywords.map((keyword) {
          final isSelected = _selectedKeywords.contains(keyword);
          return FilterChip(
            label: Text(
              keyword,
              style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.black : Colors.white70),
            ),
            selected: isSelected,
            onSelected: (_) => _toggleKeywordFilter(keyword),
            backgroundColor: Colors.grey[800],
            selectedColor: Colors.amber,
            checkmarkColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          );
        }).toList(),
      ),
    );
  }

  /// ⚠️ КЛЮЧЕВОЙ МЕТОД: всегда строит список всех 7 секций
  Widget _buildSectionsList() {
    print('🔨 _buildSectionsList() вызван');
    print('📊 _units.length = ${_units.length}');

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _sections.length,
      itemBuilder: (context, index) {
        final section = _sections[index];
        print('📁 Строим секцию: $section');
        return _buildSection(section);
      },
    );
  }

  Widget _buildSection(String title) {
    final selectedUnits = _getSelectedUnitsForSection(title);
    final availableCount = _getAvailableCountForSection(title);

    print(
        '  📌 $title: selected=${selectedUnits.length}, available=$availableCount');

    return CollapsibleSection(
      title: title,
      itemCount: availableCount,
      selectedCount: selectedUnits.length,
      onAddPressed: () => _showUnitSelector(title),
      children: selectedUnits.isEmpty
          ? [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Нет выбранных юнитов. Нажмите + чтобы добавить.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]
          : selectedUnits
              .map((unit) => _buildUnitListItem(unit, title))
              .toList(),
    );
  }

  Widget _buildUnitListItem(UnitSummary unit, String sectionTitle) {
    return UnitListItem(
      name: unit.datasheet.name,
      cost: unit.minCost ?? 0,
      description: unit.keywordsString,
      isSelected: true,
      onSelectPressed: () {
        setState(() {
          _selectedUnits[sectionTitle]!.remove(unit.datasheet.id);
        });
      },
      onInfoPressed: () => showDialog(
        context: context,
        builder: (ctx) => UnitDetailPopup(unit: unit),
      ),
    );
  }

  Widget _buildBottomActions() {
    final maxPoints = context.read<AppState>().currentMaxPoints ?? 2000;
    final isOverLimit = _totalPoints > maxPoints;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        border: const Border(
          top: BorderSide(color: Colors.amber, width: 0.5),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ⚠️ ВАЖНО: mainAxisSize.min
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
}
