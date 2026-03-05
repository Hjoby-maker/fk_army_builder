// lib/screens/widgets/stratagems_panel.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class StratagemsPanel extends StatelessWidget {
  final UnitSummary unit;

  const StratagemsPanel({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available stratagems will be displayed here',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '• Armour of Contempt (1 CP)\n• Only in Death Does Duty End (1 CP)',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
