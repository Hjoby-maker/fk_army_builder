// lib/screens/widgets/unit_selection_dialog.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class UnitSelectionDialog extends StatelessWidget {
  final String title;
  final List<UnitSummary> units;
  final Set<int> selectedIds;
  final Function(int id, bool selected) onToggleSelect;

  const UnitSelectionDialog({
    super.key,
    required this.title,
    required this.units,
    required this.selectedIds,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 136, 2, 2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.sports_mma, color: Colors.amber),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Список юнитов
            Expanded(
              child: units.isEmpty
                  ? const Center(
                      child: Text(
                        'Нет доступных юнитов',
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: units.length,
                      itemBuilder: (context, index) {
                        final unit = units[index];
                        final isSelected =
                            selectedIds.contains(unit.datasheet.id);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          color: const Color.fromARGB(255, 60, 60, 60),
                          child: CheckboxListTile(
                            title: Text(
                              unit.datasheet.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (unit.role != null)
                                  Text(
                                    'Тип: ${unit.role}',
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 12),
                                  ),
                                if (unit.keywords.isNotEmpty)
                                  Text(
                                    'Ключевые слова: ${unit.keywordsString}',
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ),
                            value: isSelected,
                            onChanged: (selected) {
                              onToggleSelect(
                                  unit.datasheet.id, selected ?? false);
                            },
                            secondary: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: unit.hasCost
                                    ? Colors.amber.withOpacity(0.2)
                                    : Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                unit.costString,
                                style: TextStyle(
                                  color:
                                      unit.hasCost ? Colors.amber : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            activeColor: Colors.amber,
                            checkColor: Colors.black,
                          ),
                        );
                      },
                    ),
            ),

            // Кнопки действий
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                    ),
                    child: const Text('Закрыть'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Готово'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
