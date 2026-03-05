// lib/screens/widgets/profile_panel.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class ProfilePanel extends StatelessWidget {
  final UnitSummary unit;

  const ProfilePanel({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unit profile will be displayed here',
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
            'M: 6" | T: 4 | SV: 3+ | W: 2 | LD: 7+ | OC: 2',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
