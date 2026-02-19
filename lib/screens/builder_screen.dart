import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals/app_state.dart';
import '../screens/widgets/collapsible_section.dart';
import '../screens/widgets/bottom_nav_bar.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  int _selectedNavIndex = 0; // По умолчанию Home
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // Получаем значения из AppState
    final armyName = appState.currentArmyName!;
    final faction = appState.currentFaction!;
    final maxPoints = appState.currentMaxPoints!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Конструктор армии'),
        backgroundColor: const Color.fromARGB(255, 136, 2, 2),
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
            // Блок с информацией об армии (опционально)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black12,
              child: Column(
                children: [
                  Text(
                    armyName,
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
                      _buildInfoChip('Фракция', faction),
                      const SizedBox(width: 8),
                      _buildInfoChip('Очки', '$maxPoints'),
                    ],
                  ),
                ],
              ),
            ),
            // 7 сворачиваемых секций
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  // Секция 1: Лидеры / Герои
                  CollapsibleSection(
                    title: 'EPIC HERO',
                    itemCount: 0, // Замените на реальное количество
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      // Сюда будут добавляться виджеты позже
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Секция 2: Элита
                  CollapsibleSection(
                    title: 'Characters',
                    itemCount: 0,
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Секция 3: Бойцы
                  CollapsibleSection(
                    title: 'Battleline',
                    itemCount: 0,
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Секция 4: Поддержка
                  CollapsibleSection(
                    title: 'Dedicated Transports',
                    itemCount: 0,
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Секция 5: Транспорт
                  CollapsibleSection(
                    title: 'Other',
                    itemCount: 0,
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Секция 6: Укрепления
                  CollapsibleSection(
                    title: 'Fortifications',
                    itemCount: 0,
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Секция 7: Альянсы / Дополнительные
                  CollapsibleSection(
                    title: 'Starred',
                    itemCount: 0,
                    onAddPressed: () {
                      // Логика добавления эпического героя
                      print('Добавить эпического героя');
                      // Здесь можно показать диалог выбора или перейти на другой экран
                    },
                    children: [
                      const Text(
                        'Нажмите "+" чтобы добавить единицу',
                        style: TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  // Замените _buildBottomNavBar на:
  Widget _buildBottomNavBar() {
    return BottomNavBar(
      selectedIndex: _selectedNavIndex,
      onItemTapped: (index) {
        setState(() {
          _selectedNavIndex = index;
        });

        switch (index) {
          case 0: // Home
            Navigator.pushNamed(context, '/');
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

// Вспомогательный метод для чипсов информации
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
          Text(
            '$label: ',
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
