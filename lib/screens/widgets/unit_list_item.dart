// lib/screens/widgets/unit_list_item.dart
import 'package:flutter/material.dart';

class UnitListItem extends StatelessWidget {
  final String name;
  final int cost;
  final String description;
  final bool isSelected;
  final VoidCallback onSelectPressed;
  final VoidCallback onInfoPressed;

  const UnitListItem({
    super.key,
    required this.name,
    required this.cost,
    required this.description,
    required this.isSelected,
    required this.onSelectPressed,
    required this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.amber.withOpacity(0.2)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.amber : Colors.amber.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            cost.toString(),
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.amber,
              onPressed: onInfoPressed,
            ),
            IconButton(
              icon: Icon(
                isSelected ? Icons.remove_circle : Icons.add_circle,
              ),
              color: isSelected ? Colors.red : Colors.green,
              onPressed: onSelectPressed,
            ),
          ],
        ),
      ),
    );
  }
}
