import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fk_army_builder/models/faction.dart';
import 'package:fk_army_builder/globals/app_state.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late Future<List<Faction>> _factionsFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Получаем DatabaseService через AppState
    final appState = Provider.of<AppState>(context, listen: false);
    _factionsFuture = _loadFactions(appState);
  }

  Future<List<Faction>> _loadFactions(AppState appState) async {
    try {
      // Ждем инициализацию AppState если нужно
      if (!appState.initialized) {
        await appState.initialize();
      }
      // Используем DatabaseService из AppState
      return await appState.databaseService.getAllFactions();
    } catch (e) {
      throw Exception('Ошибка загрузки фракций: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сохраненные армии'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Consumer<AppState>(
            builder: (context, appState, child) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _factionsFuture = _loadFactions(appState);
                  });
                },
                tooltip: 'Обновить',
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Faction>>(
        future: _factionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      '${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer<AppState>(
                    builder: (context, appState, child) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _factionsFuture = _loadFactions(appState);
                          });
                        },
                        child: const Text('Повторить'),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          
          final factions = snapshot.data ?? [];
          
          if (factions.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder, size: 64, color: Colors.orange),
                  SizedBox(height: 16),
                  Text(
                    'Нет сохраненных фракций',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Добавьте фракции из CSV файла'),
                ],
              ),
            );
          }
          
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: factions.length,
            itemBuilder: (context, index) {
              final faction = factions[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      faction.name[0].toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  title: Text(faction.name),
                  subtitle: faction.link != null 
                      ? Text(faction.link!, maxLines: 1, overflow: TextOverflow.ellipsis)
                      : null,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Переход к деталям фракции
                    _showFactionDetails(context, faction);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showFactionDetails(BuildContext context, Faction faction) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              faction.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('ID', '${faction.id}'),
            const Divider(),
            _buildDetailRow('Название', faction.name),
            if (faction.link != null) ...[
              const Divider(),
              _buildDetailRow('Ссылка', faction.link!),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Закрыть'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}