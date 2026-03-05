// lib/screens/widgets/leader_panel.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class LeaderPanel extends StatelessWidget {
  final UnitSummary unit;

  const LeaderPanel({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'This unit can be led by:',
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
            '• Captain\n• Lieutenant\n• Chaplain',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
