import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../globals/app_state.dart';
import '../database/services/database_service.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  Future<void> _printUniqueKeywords(String factionName) async {
    print('========== КЛЮЧЕВЫЕ СЛОВА ДЛЯ ФРАКЦИИ: $factionName ==========');
    final keywords =
        await DatabaseService().getUniqueKeywordsByFactionName(factionName);
    if (keywords.isEmpty) {
      print('Ключевые слова не найдены для фракции "$factionName"');
      return;
    }
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    for (var i = 0; i < keywords.length; i++) {
      print('${i + 1}. ${keywords[i]}');
    }

    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // Получаем значения из AppState
    final armyName = appState.currentArmyName!;
    final factionType = appState.currentFactionType!;
    final faction = appState.currentFaction!;
    final maxPoints = appState.currentMaxPoints!;

    // Вызываем запрос при построении экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _printUniqueKeywords(faction);
      // Для более детальной информации:
      // _printKeywordsWithDetails(faction);
    });

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
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Новая армия создана!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow('Название:', armyName), // НОВАЯ СТРОКА
                  _buildInfoRow('Тип фракции:', factionType),
                  _buildInfoRow('Фракция:', faction),
                  _buildInfoRow('Макс. очков:', maxPoints.toString()),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Назад'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
