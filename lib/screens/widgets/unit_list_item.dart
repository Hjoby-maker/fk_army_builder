// lib/widgets/unit_list_item.dart
import 'package:flutter/material.dart';

/// Элемент списка юнита: название + стоимость + кнопка инфо
class UnitListItem extends StatelessWidget {
  final String name;
  final int cost;
  final VoidCallback? onInfoPressed;
  final VoidCallback? onSelectPressed;
  final bool isSelected;
  final String? description;

  const UnitListItem({
    super.key,
    required this.name,
    required this.cost,
    this.onInfoPressed,
    this.onSelectPressed,
    this.isSelected = false,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.amber.withOpacity(0.25)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.amber : Colors.white.withOpacity(0.15),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onSelectPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              // Checkbox или иконка выбора
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.amber : Colors.white70,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.amber, size: 18)
                    : null,
              ),
              const SizedBox(width: 12),
              // Название и описание
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (description != null)
                      Text(
                        description!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Стоимость
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.bolt, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '$cost',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Кнопка информации
              if (onInfoPressed != null)
                IconButton(
                  onPressed: onInfoPressed,
                  icon: const Icon(Icons.info_outline,
                      color: Colors.white70, size: 20),
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 32, minHeight: 32),
                  tooltip: 'Подробная информация',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
