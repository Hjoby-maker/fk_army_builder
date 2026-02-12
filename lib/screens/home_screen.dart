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

  Future<void> _saveUpdateDate() async {
    final now = DateTime.now();
    final formattedDate = '${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}';
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_update_date', formattedDate);
    
    setState(() {
      _lastUpdateDate = formattedDate;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Дата обновления сохранена')),
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
              Color(0xFF1a237e),
              Color(0xFF283593),
              Color(0xFF3949ab),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Заголовок приложения
              _buildAppHeader(),
              
              // Информационная карточка
              _buildInfoCard(),
              
              // Основные действия
              Expanded(
                child: _buildActionGrid(),
              ),
              
              // Нижняя панель
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          // Логотип
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
            ),
            child: const Icon(
              Icons.military_tech,
              size: 40,
              color: Colors.white,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Название приложения
          const Text(
            'Warhammer 40k\nArmy Builder',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Версия приложения
          Text(
            'Версия $_appVersion',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          // Редакция правил
          _buildInfoRow(
            icon: Icons.book,
            title: 'Редакция правил:',
            value: _rulesVersion,
            color: Colors.amber,
          ),
          
          const Divider(color: Colors.white30, height: 20),
          
          // Последнее обновление
          _buildInfoRow(
            icon: Icons.update,
            title: 'Последняя загрузка:',
            value: _lastUpdateDate,
            color: Colors.greenAccent,
          ),
          
          const SizedBox(height: 12),
          
          // Кнопка обновления
          ElevatedButton.icon(
            onPressed: _saveUpdateDate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(double.infinity, 44),
            ),
            icon: const Icon(Icons.refresh, size: 20),
            label: const Text('Обновить дату загрузки'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionGrid() {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.9,
      children: [
        // Загрузка файлов
        _buildActionCard(
          title: 'Загрузка файлов',
          subtitle: 'Обновление данных из сети',
          icon: Icons.cloud_download,
          color: Colors.blue,
          onTap: () {
            Navigator.pushNamed(context, '/download');
          },
        ),
        
        // Рабочий экран
        _buildActionCard(
          title: 'Конструктор армий',
          subtitle: 'Создание списков армий',
          icon: Icons.build,
          color: Colors.green,
          onTap: () {
            Navigator.pushNamed(context, '/builder');
          },
        ),
        
        // Сохраненные работы
        _buildActionCard(
          title: 'Сохраненные армии',
          subtitle: 'Мои списки армий',
          icon: Icons.folder,
          color: Colors.orange,
          onTap: () {
            Navigator.pushNamed(context, '/saved');
          },
        ),
        
        // Настройки
        _buildActionCard(
          title: 'Настройки',
          subtitle: 'Параметры приложения',
          icon: Icons.settings,
          color: Colors.purple,
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        
        // Просмотр фракций
        _buildActionCard(
          title: 'Фракции',
          subtitle: 'Список всех фракций',
          icon: Icons.list,
          color: Colors.red,
          onTap: () {
            Navigator.pushNamed(context, '/factions');
          },
        ),
        
        // Справка
        _buildActionCard(
          title: 'Справка',
          subtitle: 'Инструкция и помощь',
          icon: Icons.help,
          color: Colors.teal,
          onTap: () {
            Navigator.pushNamed(context, '/help');
          },
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Иконка
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              
              const SizedBox(height: 12),
              
              // Заголовок
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color.withOpacity(0.9),
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Подзаголовок
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Статус
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Онлайн',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          
          // Копирайт
          const Text(
            '© 2024 WH40k Army Builder',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}