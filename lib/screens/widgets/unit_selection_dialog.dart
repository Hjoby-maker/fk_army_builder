// lib/screens/widgets/unit_selection_dialog.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class UnitSelectionDialog extends StatefulWidget {
  final String title;
  final List<UnitSummary> units;
  final Set<int> selectedIds;
  final Function(int id, bool selected) onToggleSelect;
  final Function(int id, int quantity)? onQuantityChange; // Новый параметр

  const UnitSelectionDialog({
    super.key,
    required this.title,
    required this.units,
    required this.selectedIds,
    required this.onToggleSelect,
    this.onQuantityChange, // Добавляем опциональный параметр
  });

  @override
  State<UnitSelectionDialog> createState() => _UnitSelectionDialogState();
}

class _UnitSelectionDialogState extends State<UnitSelectionDialog> {
  // Словарь для хранения количества выбранных юнитов
  late Map<int, int> _quantities;

  // Секции, где можно выбирать несколько одинаковых юнитов
  final Set<String> _multiSelectSections = {
    'Battleline',
    'Infantry',
    'Vehicle',
    'Dedicated Transports',
    'Fortifications',
  };

  @override
  void initState() {
    super.initState();
    _initializeQuantities();
  }

  void _initializeQuantities() {
    _quantities = {};
    for (var unit in widget.units) {
      if (widget.selectedIds.contains(unit.datasheet.id)) {
        _quantities[unit.datasheet.id] = 1;
      } else {
        _quantities[unit.datasheet.id] = 0;
      }
    }
  }

  bool get _isMultiSelectSection => _multiSelectSections.contains(widget.title);

  void _incrementQuantity(int unitId) {
    setState(() {
      final newQuantity = (_quantities[unitId] ?? 0) + 1;
      _quantities[unitId] = newQuantity;

      // Уведомляем родителя
      widget.onToggleSelect(unitId, true);
      if (widget.onQuantityChange != null) {
        widget.onQuantityChange!(unitId, newQuantity);
      }
    });
  }

  void _decrementQuantity(int unitId) {
    setState(() {
      final currentQty = _quantities[unitId] ?? 0;
      if (currentQty > 0) {
        final newQuantity = currentQty - 1;
        _quantities[unitId] = newQuantity;

        if (newQuantity == 0) {
          widget.onToggleSelect(unitId, false);
        }

        if (widget.onQuantityChange != null) {
          widget.onQuantityChange!(unitId, newQuantity);
        }
      }
    });
  }

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
                    widget.title,
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

            // Подзаголовок с пояснением
            if (_isMultiSelectSection)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.amber.withOpacity(0.1),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.amber, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'В этой секции можно выбрать несколько одинаковых юнитов',
                        style: TextStyle(color: Colors.amber, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

            // Список юнитов
            Expanded(
              child: widget.units.isEmpty
                  ? const Center(
                      child: Text(
                        'Нет доступных юнитов',
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: widget.units.length,
                      itemBuilder: (context, index) {
                        final unit = widget.units[index];
                        final quantity = _quantities[unit.datasheet.id] ?? 0;
                        final isSelected = quantity > 0;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          color: const Color.fromARGB(255, 60, 60, 60),
                          child: _isMultiSelectSection
                              ? _buildMultiSelectTile(
                                  unit, quantity, isSelected)
                              : _buildSingleSelectTile(unit, isSelected),
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

  // Для секций с уникальными юнитами (Epic Hero, Characters)
  Widget _buildSingleSelectTile(UnitSummary unit, bool isSelected) {
    return CheckboxListTile(
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
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          if (unit.keywords.isNotEmpty)
            Text(
              'Ключевые слова: ${unit.keywordsString}',
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
      value: isSelected,
      onChanged: (selected) {
        setState(() {
          _quantities[unit.datasheet.id] = selected! ? 1 : 0;
          widget.onToggleSelect(unit.datasheet.id, selected);
          if (widget.onQuantityChange != null) {
            widget.onQuantityChange!(unit.datasheet.id, selected ? 1 : 0);
          }
        });
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
            color: unit.hasCost ? Colors.amber : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      activeColor: Colors.amber,
      checkColor: Colors.black,
    );
  }

  // Для секций, где можно выбирать несколько одинаковых юнитов
  Widget _buildMultiSelectTile(
      UnitSummary unit, int quantity, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          // Информация о юните
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unit.datasheet.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                if (unit.role != null)
                  Text(
                    'Тип: ${unit.role}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 11),
                  ),
                if (unit.keywords.isNotEmpty)
                  Text(
                    'Ключевые слова: ${unit.keywordsString}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),

          // Стоимость
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: unit.hasCost
                  ? Colors.amber.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              unit.costString,
              style: TextStyle(
                color: unit.hasCost ? Colors.amber : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),

          // Контролы количества
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Кнопка минус
                InkWell(
                  onTap: quantity > 0
                      ? () => _decrementQuantity(unit.datasheet.id)
                      : null,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.remove,
                      color: quantity > 0 ? Colors.amber : Colors.grey[600],
                      size: 18,
                    ),
                  ),
                ),

                // Количество
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),

                // Кнопка плюс
                InkWell(
                  onTap: () => _incrementQuantity(unit.datasheet.id),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.add,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
