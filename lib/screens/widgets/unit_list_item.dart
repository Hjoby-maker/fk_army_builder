// lib/screens/widgets/unit_list_item.dart
import 'package:flutter/material.dart';
import '../unit_detail_screen.dart';
import '../../database/queries/cross_table_queries.dart';

class UnitListItem extends StatelessWidget {
  final String name;
  final int cost;
  final String description;
  final int quantity;
  final int instanceId; // ← новый параметр для идентификации экземпляра
  final bool isSelected;
  final UnitSummary? unit;
  final VoidCallback onSelectPressed;

  const UnitListItem({
    super.key,
    required this.name,
    required this.cost,
    required this.description,
    this.quantity = 1,
    this.instanceId = 0, // ← по умолчанию 0
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
        leading: Stack(
          children: [
            Container(
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
            // Индикатор номера экземпляра (для одинаковых юнитов)
            if (instanceId > 0)
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '${instanceId + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
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
            // Добавляем индикатор легендарности если есть
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
            // Кнопка информации
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.amber,
              onPressed: unit != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UnitDetailScreen(unit: unit!),
                        ),
                      );
                    }
                  : null,
            ),
            // Кнопка редактирования (для будущего функционала)
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                // TODO: открыть экран редактирования конкретного экземпляра
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Редактирование экземпляра ${instanceId + 1}'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
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
