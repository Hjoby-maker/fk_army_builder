// lib/screens/widgets/unit_list_item.dart
import 'package:flutter/material.dart';
import '../unit_detail_screen.dart';
import '../../database/queries/cross_table_queries.dart';

class UnitListItem extends StatelessWidget {
  final String name;
  final int cost;
  final String description;
  final int quantity;
  final int instanceId;
  final String sectionTitle;
  final bool isSelected;
  final UnitSummary? unit;
  final VoidCallback onSelectPressed;

  const UnitListItem({
    super.key,
    required this.name,
    required this.cost,
    required this.description,
    this.quantity = 1,
    required this.instanceId, // ← делаем required
    required this.sectionTitle,
    required this.isSelected,
    this.unit,
    required this.onSelectPressed,
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
        title: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Индикатор легендарности если есть
            if (unit?.isLegendary ?? false)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple.withOpacity(0.5)),
                ),
                child: const Text(
                  'LEGEND',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
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
            // Кнопка информации (открывает детальный экран)
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.amber,
              onPressed: unit != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UnitDetailScreen(
                            unit: unit!,
                            instanceId: instanceId,
                            sectionTitle: sectionTitle,
                          ),
                        ),
                      );
                    }
                  : null,
            ),
            // Кнопка удаления
            IconButton(
              icon: const Icon(Icons.remove_circle),
              color: Colors.red,
              onPressed: onSelectPressed,
            ),
          ],
        ),
      ),
    );
  }
}
