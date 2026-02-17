import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _lastUpdateDate = 'Не загружалось';
  final String _appVersion = '1.0.0';
  final String _rulesVersion = '10th Edition';

  @override
  void initState() {
    super.initState();
    _loadLastUpdateDate();
  }

  Future<void> _loadLastUpdateDate() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString('last_update_date');

    if (savedDate != null) {
      setState(() {
        _lastUpdateDate = savedDate;
      });
    }
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
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.update,
              color: Colors.greenAccent,
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
            onTap: () {
              Navigator.pushNamed(context, '/builder');
            },
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber,
                    //color: color.withOpacity(0.9),
                  ),
                ),
              ),

              // Стрелка
              Icon(
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home
          _buildNavItem(
            icon: Icons.home,
            label: 'Home',
            isSelected: true,
            onTap: () {},
          ),

          // Analyze
          _buildNavItem(
            icon: Icons.analytics_outlined,
            label: 'Analyze',
            isSelected: false,
            onTap: () {
              Navigator.pushNamed(context, '/analyze');
            },
          ),

          // Setting (ведет на страницу загрузки)
          _buildNavItem(
            icon: Icons.settings,
            label: 'Setting',
            isSelected: false,
            onTap: () {
              Navigator.pushNamed(context, '/download');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white60,
            size: 22,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white60,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
