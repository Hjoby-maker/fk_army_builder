import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../database/services/database_service.dart';
import '../globals/constants.dart';
import '../globals/app_state.dart';
import '../screens/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _lastUpdateDate = 'Не загружалось';
  //final String _appVersion = '1.0.0';
  //final String _rulesVersion = '10th Edition';

  // Для модального окна
  String? _selectedFactionType;
  String? _selectedFaction;
  final TextEditingController _armyNameController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  // Получаем уникальные типы фракций из csvTable
  late final List<String> _factionTypes =
      csvTable.map((row) => row[0]).toSet().toList();

  // Карта для связи тип фракции -> список фракций
  late final Map<String, List<String>> _factionsByType = () {
    final map = <String, List<String>>{};
    for (var row in csvTable) {
      final type = row[0];
      final faction = row[1];
      if (!map.containsKey(type)) {
        map[type] = [];
      }
      map[type]!.add(faction);
    }
    return map;
  }();

  @override
  void initState() {
    super.initState();
    _loadLastUpdateDate();
  }

  Future<void> _loadLastUpdateDate() async {
    final date = await DatabaseService().getLastUpdateDate();
    //final prefs = await SharedPreferences.getInstance();
    final savedDate = date.toString().substring(0, 10);

    //if (savedDate != null) {
    setState(() {
      _lastUpdateDate = savedDate;
    });
    //}
  }

  @override
  void dispose() {
    _armyNameController.dispose(); // НОВЫЙ DISPOSE
    _pointsController.dispose();
    super.dispose();
  }

  void _showNewArmyDialog() {
    // Сбрасываем значения при открытии
    _armyNameController.clear();
    _selectedFactionType = null;
    _selectedFaction = null;
    _pointsController.clear();

    showDialog(
      context: context,
      barrierDismissible: true, // Разрешаем закрытие по тапу вне окна
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF2D2D2D),
              title: const Text(
                'Создание новой армии',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Название армии:',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _armyNameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Введите название армии',
                        hintStyle: const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.amber.withOpacity(0.5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.amber.withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    // Первый выпадающий список - тип фракции
                    const Text(
                      'Тип фракции:',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.amber.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.05),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedFactionType,
                          isExpanded: true,
                          hint: const Text(
                            'Выберите тип фракции',
                            style: TextStyle(color: Colors.white54),
                          ),
                          dropdownColor: const Color(0xFF1E1E1E),
                          style: const TextStyle(color: Colors.white),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.amber),
                          items: _factionTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedFactionType = newValue;
                              _selectedFaction =
                                  null; // Сбрасываем выбор фракции
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Второй выпадающий список - фракция
                    const Text(
                      'Фракция:',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.amber.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.05),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedFaction,
                          isExpanded: true,
                          hint: Text(
                            _selectedFactionType == null
                                ? 'Сначала выберите тип фракции'
                                : 'Выберите фракцию',
                            style: const TextStyle(color: Colors.white54),
                          ),
                          dropdownColor: const Color(0xFF1E1E1E),
                          style: const TextStyle(color: Colors.white),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.amber),
                          items: _selectedFactionType != null
                              ? _factionsByType[_selectedFactionType]!
                                  .map((String faction) {
                                  return DropdownMenuItem<String>(
                                    value: faction,
                                    child: Text(faction),
                                  );
                                }).toList()
                              : [],
                          onChanged: _selectedFactionType != null
                              ? (String? newValue) {
                                  setState(() {
                                    _selectedFaction = newValue;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Поле ввода очков
                    const Text(
                      'Максимум очков:',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _pointsController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Например: 2000',
                        hintStyle: const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.amber.withOpacity(0.5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.amber.withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                // Кнопка Отмена
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white70,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Отмена'),
                ),

                // Кнопка ОК
                ElevatedButton(
                  onPressed: () {
                    // Проверка заполнения полей
                    final armyName = _armyNameController.text.trim();
                    if (armyName.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Введите название армии'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (_selectedFactionType == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Выберите тип фракции'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (_selectedFaction == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Выберите фракцию'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final pointsText = _pointsController.text.trim();
                    if (pointsText.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Введите максимальное количество очков'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final points = int.tryParse(pointsText);
                    if (points == null || points <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Введите корректное число очков'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // СОХРАНЯЕМ ПАРАМЕТРЫ В APPSTATE
                    final appState =
                        Provider.of<AppState>(context, listen: false);
                    appState.setNewArmyParams(
                      armyName: armyName,
                      factionType: _selectedFactionType!,
                      faction: _selectedFaction!,
                      maxPoints: points,
                    );

                    // Все проверки пройдены - закрываем диалог и переходим на страницу билдера
                    Navigator.of(context).pop();

                    // Переходим на страницу билдера с параметрами
                    Navigator.pushNamed(context, '/builder');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  child: const Text('ОК'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Column(
            children: [
              // Заголовок приложения
              _buildAppHeader(),

              // Информационная карточка с датой обновления
              _buildInfoCard(),

              // Кнопки действий
              Expanded(
                child: _buildActionButtons(),
              ),

              // Нижняя панель навигации
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: const Column(
        children: [
          Text(
            'Army roster creator',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '10th Edition',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'update: 17.02.2026',
            style: TextStyle(
              fontSize: 14,
              color: Colors.amber,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 105, 193).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.update,
              color: Color.fromARGB(255, 255, 46, 147),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Последнее обновление',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  _lastUpdateDate,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          /*TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/download');
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh, size: 16),
                SizedBox(width: 4),
                Text('Обновить'),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // New army list - прямоугольная кнопка
          _buildRectangularButton(
            title: 'New army list',
            icon: Icons.add_circle_outline,
            color: const Color.fromARGB(255, 42, 21, 3),
            onTap: _showNewArmyDialog, //() {
            // Navigator.pushNamed(context, '/builder');
            //},
          ),

          const SizedBox(height: 12),

          // My army lists - прямоугольная кнопка
          _buildRectangularButton(
            title: 'My army lists',
            icon: Icons.folder_outlined,
            color: const Color.fromARGB(255, 42, 21, 3),
            onTap: () {
              Navigator.pushNamed(context, '/saved');
            },
          ),

          const SizedBox(height: 12),

          // My tournament - прямоугольная кнопка
          _buildRectangularButton(
            title: 'My tournament',
            icon: Icons.emoji_events_outlined,
            color: const Color.fromARGB(255, 42, 21, 3),
            onTap: () {
              Navigator.pushNamed(context, '/tournament');
            },
          ),

          const Spacer(),

          // Дополнительная информация или место для рекламы
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Select an option to begin building your army',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRectangularButton({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                color.withOpacity(1),
                color.withOpacity(0.5),
              ],
            ),
            border: Border.all(
              color: color.withOpacity(0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Иконка
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.amber,
                  size: 26,
                ),
              ),

              const SizedBox(width: 20),

              // Текст
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber,
                    //color: color.withOpacity(0.9),
                  ),
                ),
              ),

              // Стрелка
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.orangeAccent,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavBar(
      selectedIndex: 0, // Home выбран
      onItemTapped: (index) {
        switch (index) {
          case 0: // Home
            // Уже на home, ничего не делаем
            break;
          case 1: // Analyze
            Navigator.pushNamed(context, '/analyze');
            break;
          case 2: // Setting
            Navigator.pushNamed(context, '/download');
            break;
        }
      },
    );
  }
}
