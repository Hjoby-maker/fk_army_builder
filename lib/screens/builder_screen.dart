// lib/screens/builder_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals/app_state.dart';
import '../screens/widgets/collapsible_section.dart';
import '../screens/widgets/unit_list_item.dart';
import '../screens/widgets/unit_selection_dialog.dart';
import '../screens/widgets/bottom_nav_bar.dart';
import '../screens/widgets/army_option.dart';
import '../screens/widgets/detachment_dialog.dart';
import '../screens/widgets/points_dialog.dart';
import '../database/queries/cross_table_queries.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  late CrossTableQueries _queries;
  bool _isConfigurationExpanded = false; // По умолчанию свернута
  List<UnitSummary> _units = [];
  final Set<String> _selectedKeywords = {};

  bool _isLoading = false;
  String? _error;

  // 🔹 Новая структура для хранения выбранных юнитов с количеством
  // Map<Название секции, Map<ID юнита, количество>>
  final Map<String, Map<int, int>> _selectedUnitsWithQuantity = {
    'Configuration': {}, // Новая секция
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
    'Configuration', // Новая секция первой
    'Epic Hero',
    'Characters',
    'Battleline',
    'Infantry',
    'Vehicle',
    'Dedicated Transports',
    'Fortifications',
  ];

  // Добавьте новый метод для обработки нажатий на кнопки конфигурации
  void _showConfigurationDialog(String type) {
    switch (type) {
      case 'Points':
        _showPointsDialog();
        break;
      case 'Detachment':
        _showDetachmentDialog();
        break;
      case 'ArmyOption':
        _showArmyOption();
        break;
    }
  }

  void _showPointsDialog() {
    showDialog(
      context: context,
      builder: (context) => const PointsDialog(),
    );
  }

  void _showDetachmentDialog() {
    showDialog(
      context: context,
      builder: (context) => const DetachmentDialog(),
    );
  }

  void _showArmyOption() {
    showDialog(
      context: context,
      builder: (context) => ArmyOption(
        onSettingsChanged: _reloadData,
      ),
    );
  }

  late AnimationController _configurationController;
  late Animation<double> _configurationIconTurns;

  @override
  void initState() {
    super.initState();
    _configurationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _configurationIconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _configurationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _initService();
  }

  @override
  void dispose() {
    _configurationController.dispose();
    super.dispose();
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
          showLegendary: appState.showLegendaryUnits,
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

  /// Получаем количество доступных юнитов в секции
  int _getAvailableCountForSection(String section) {
    if (_units.isEmpty) return 0;
    return _units.where((unit) => _getUnitSection(unit) == section).length;
  }

  /// Получаем выбранные юниты для секции (с дубликатами)
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

  /// Получает информацию о конкретном экземпляре юнита
  Map<String, dynamic>? _getUnitInstanceInfo(
      String sectionTitle, int unitId, int instanceId) {
    final units = _getSelectedUnitsForSection(sectionTitle);
    int currentInstance = 0;

    for (int i = 0; i < units.length; i++) {
      if (units[i].datasheet.id == unitId) {
        if (currentInstance == instanceId) {
          return {
            'index': i,
            'unit': units[i],
            'instanceNumber': instanceId + 1,
            'totalInstances':
                units.where((u) => u.datasheet.id == unitId).length,
          };
        }
        currentInstance++;
      }
    }
    return null;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Информация о фракции и детачменте
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
                const SizedBox(height: 2),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    // Фракция
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.amber.withOpacity(0.3)),
                      ),
                      child: Text(
                        appState.currentFaction ?? 'Фракция не выбрана',
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12),
                      ),
                    ),

                    // Детачмент (если выбран)
                    if (appState.currentDetachment != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.amber.withOpacity(0.3)),
                        ),
                        child: Text(
                          appState.currentDetachment!,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Счетчик юнитов
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
    // Специальная обработка для секции Configuration
    if (title == 'Configuration') {
      return _buildConfigurationSection();
    }
    final selectedUnits = _getSelectedUnitsForSection(title);
    final availableCount = _getAvailableCountForSection(title);

    return CollapsibleSection(
      title: title,
      itemCount: availableCount,
      selectedCount: selectedUnits.length,
      onAddPressed: () => _showUnitSelector(title),
      initiallyExpanded: false, // Все остальные секции развернуты по умолчанию
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

  // Новый метод для построения секции Configuration
  Widget _buildConfigurationSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Заголовок секции с возможностью сворачивания
          InkWell(
            onTap: _toggleConfiguration,
            child: Container(
              height: 56.0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  // Иконка сворачивания
                  RotationTransition(
                    turns: _configurationIconTurns,
                    child: const Icon(Icons.expand_more,
                        color: Colors.amber, size: 24),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.settings, color: Colors.amber, size: 24),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Configuration',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Счетчик не показываем
                ],
              ),
            ),
          ),

          // Контент секции - сворачиваемый
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildConfigButton(
                    icon: Icons.edit,
                    label: 'Points',
                    description: 'Set count points',
                    onTap: () => _showConfigurationDialog('Points'),
                  ),
                  const SizedBox(height: 8),
                  _buildConfigButton(
                    icon: Icons.group,
                    label: 'Detachment',
                    description: 'Choose detachment for faction',
                    onTap: () => _showConfigurationDialog('Detachment'),
                  ),
                  const SizedBox(height: 8),
                  _buildConfigButton(
                    icon: Icons.track_changes,
                    label: 'Army Option',
                    description: 'Set options for visible',
                    onTap: () => _showConfigurationDialog('ArmyOption'),
                  ),
                ],
              ),
            ),
            crossFadeState: _isConfigurationExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  // Вспомогательный метод для создания кнопок конфигурации
  Widget _buildConfigButton({
    required IconData icon,
    required String label,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.amber, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.amber,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Строит список юнитов - каждый экземпляр отдельной строкой
  List<Widget> _buildUnitListWithQuantities(
      List<UnitSummary> units, String sectionTitle) {
    final result = <Widget>[];

    // Для каждого юнита в списке (с учетом дубликатов) создаем отдельный элемент
    for (int i = 0; i < units.length; i++) {
      final unit = units[i];
      final id = unit.datasheet.id;

      result.add(
        UnitListItem(
          key: ValueKey('${id}_$i'), // уникальный ключ для каждого экземпляра
          name: unit.datasheet.name,
          cost: unit.minCost ?? 0,
          description: unit.keywordsString,
          quantity: 1, // всегда 1, так как каждый экземпляр отдельно
          instanceId: i, // передаем индекс для идентификации экземпляра
          isSelected: true,
          unit: unit,
          onSelectPressed: () {
            setState(() {
              // Удаляем конкретный экземпляр по индексу
              _removeUnitInstance(sectionTitle, id, i);
            });
          },
        ),
      );
    }

    return result;
  }

  /// Удаляет конкретный экземпляр юнита
  void _removeUnitInstance(String sectionTitle, int unitId, int instanceId) {
    // Получаем текущий список выбранных юнитов для секции
    final currentUnits = _getSelectedUnitsForSection(sectionTitle);

    // Находим индекс этого конкретного экземпляра в общем списке
    int instanceIndex = -1;
    int currentInstanceCount = 0;

    for (int i = 0; i < currentUnits.length; i++) {
      if (currentUnits[i].datasheet.id == unitId) {
        if (currentInstanceCount == instanceId) {
          instanceIndex = i;
          break;
        }
        currentInstanceCount++;
      }
    }

    if (instanceIndex != -1) {
      // Создаем новый список без этого экземпляра
      final updatedUnits = List<UnitSummary>.from(currentUnits)
        ..removeAt(instanceIndex);

      // Обновляем _selectedUnitsWithQuantity
      final quantityMap = <int, int>{};
      for (final unit in updatedUnits) {
        quantityMap[unit.datasheet.id] =
            (quantityMap[unit.datasheet.id] ?? 0) + 1;
      }
      _selectedUnitsWithQuantity[sectionTitle] = quantityMap;
    }
  }

  Widget _buildBottomActions() {
    final maxPoints = context.read<AppState>().currentMaxPoints ?? 2000;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.black26,
        border: Border(
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

    final unit0 = unit.datasheet.role?.toLowerCase();

    if (unit0 == 'characters') {
      if (keywords.contains('epic hero')) {
        return 'Epic Hero';
      }
    }
    if (unit0 == 'other') {
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

  void _toggleConfiguration() {
    setState(() {
      _isConfigurationExpanded = !_isConfigurationExpanded;
      if (_isConfigurationExpanded) {
        _configurationController.forward();
      } else {
        _configurationController.reverse();
      }
    });
  }

  Future<void> _reloadData() async {
    // Просто вызываем существующий метод загрузки
    await _loadData();
  }
}
