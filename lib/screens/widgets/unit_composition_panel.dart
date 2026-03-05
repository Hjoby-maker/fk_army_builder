// lib/screens/widgets/unit_composition_panel.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class UnitCompositionPanel extends StatelessWidget {
  final UnitSummary unit;

  const UnitCompositionPanel({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unit composition will be displayed here',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 8),
        if (unit.costs.isNotEmpty)
          ...unit.costs.map((cost) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      cost.description ?? 'Model',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    '${cost.cost} pts',
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }
}
