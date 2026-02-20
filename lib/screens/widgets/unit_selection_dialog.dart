// lib/widgets/unit_selection_dialog.dart
import 'package:flutter/material.dart';
import 'unit_list_item.dart';
import 'unit_detail_popup.dart';

/// Модель данных для отображения юнита в диалоге
class UnitOption {
  final int id;
  final String name;
  final int cost;
  final String? description;
  final Map<String, dynamic>? details; // для детального просмотра

  UnitOption({
    required this.id,
    required this.name,
    required this.cost,
    this.description,
    this.details,
  });
}

/// Модальное окно со списком юнитов для выбора
class UnitSelectionDialog extends StatefulWidget {
  final String title;
  final List<UnitOption> units;
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
  State<UnitSelectionDialog> createState() => _UnitSelectionDialogState();
}

class _UnitSelectionDialogState extends State<UnitSelectionDialog> {
  String _searchQuery = '';

  List<UnitOption> get _filteredUnits {
    if (_searchQuery.isEmpty) return widget.units;
    final query = _searchQuery.toLowerCase();
    return widget.units
        .where((u) => u.name.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxHeight: 600),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2310),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.amber.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            // Заголовок диалога
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  bottom: BorderSide(color: Colors.amber.withOpacity(0.3)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.selectedIds.length} выбрано',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white70),
                  ),
                ],
              ),
            ),
            // Поиск
            if (widget.units.length > 5)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  onChanged: (v) => setState(() => _searchQuery = v),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Поиск юнита...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
            // Список юнитов
            Expanded(
              child: _filteredUnits.isEmpty
                  ? Center(
                      child: Text(
                        _searchQuery.isEmpty
                            ? 'Нет доступных юнитов'
                            : 'Ничего не найдено',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredUnits.length,
                      itemBuilder: (context, index) {
                        final unit = _filteredUnits[index];
                        final isSelected = widget.selectedIds.contains(unit.id);

                        return UnitListItem(
                          name: unit.name,
                          cost: unit.cost,
                          description: unit.description,
                          isSelected: isSelected,
                          onSelectPressed: () {
                            widget.onToggleSelect(unit.id, !isSelected);
                            // Не закрываем диалог - пользователь может выбрать несколько
                          },
                          onInfoPressed: unit.details != null
                              ? () => _showUnitDetails(context, unit)
                              : null,
                        );
                      },
                    ),
            ),
            // Кнопка "Готово"
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Готово',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUnitDetails(BuildContext context, UnitOption unit) {
    showDialog(
      context: context,
      builder: (ctx) => UnitDetailPopup(unit: unit),
    );
  }
}
