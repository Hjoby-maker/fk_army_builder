// lib/screens/unit_detail_screen.dart
import 'package:flutter/material.dart';
import '../database/queries/cross_table_queries.dart';
import '../screens/widgets/bottom_nav_bar.dart';
import '../screens/widgets/collapsible_panel.dart';
import '../screens/widgets/unit_composition_panel.dart';
import '../screens/widgets/profile_panel.dart';
import '../screens/widgets/stratagems_panel.dart';
import '../screens/widgets/leader_panel.dart';

class UnitDetailScreen extends StatefulWidget {
  final UnitSummary unit;
  final int instanceId;
  final String sectionTitle;

  const UnitDetailScreen({
    super.key,
    required this.unit,
    required this.instanceId,
    required this.sectionTitle,
  });

  @override
  State<UnitDetailScreen> createState() => _UnitDetailScreenState();
}

class _UnitDetailScreenState extends State<UnitDetailScreen> {
  int _selectedIndex = 1;

  // Проверка, нужно ли показывать секцию Leader
  bool get _showLeaderSection {
    return widget.unit.role?.toLowerCase() != 'epic hero' &&
        widget.unit.role?.toLowerCase() != 'characters';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 2, 2),
        title: Text(
          widget.unit.datasheet.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.amber),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Краткая информация о юните
            _buildSummaryCard(),

            const SizedBox(height: 16),

            // 1. Unit Composition Panel
            CollapsiblePanel(
              title: 'Unit Composition',
              icon: Icons.groups,
              initiallyExpanded: true,
              content: UnitCompositionPanel(
                unit: widget.unit,
                instanceId:
                    widget.instanceId, // нужно передать из builder_screen
                sectionTitle:
                    widget.sectionTitle, // нужно передать из builder_screen
              ),
            ),
            const SizedBox(height: 8),

            // 2. Profile Panel
            CollapsiblePanel(
              title: 'Profile',
              icon: Icons.bar_chart,
              content: ProfilePanel(unit: widget.unit),
            ),

            const SizedBox(height: 8),

            // 3. Stratagems Panel
            CollapsiblePanel(
              title: 'Stratagems',
              icon: Icons.local_fire_department,
              content: StratagemsPanel(unit: widget.unit),
            ),

            const SizedBox(height: 8),

            // 4. Leader Panel (условно)
            if (_showLeaderSection) ...[
              CollapsiblePanel(
                title: 'Leader',
                icon: Icons.star,
                content: LeaderPanel(unit: widget.unit),
              ),
              const SizedBox(height: 8),
            ],

            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
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
        },
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoRow('Роль', widget.unit.role ?? 'Не указана'),
            const Divider(color: Colors.amber),
            _buildInfoRow('Стоимость', widget.unit.costString),
            if (widget.unit.isLegendary) ...[
              const Divider(color: Colors.amber),
              _buildInfoRow('Статус', 'Legends Unit ⚡'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
