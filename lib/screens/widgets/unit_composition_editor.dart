// lib/screens/widgets/unit_composition_editor.dart

import 'package:flutter/material.dart';
import '../../models/unit_composition.dart';

class UnitCompositionEditor extends StatefulWidget {
  final UnitComposition composition;
  final Function(Map<String, int> selectedCounts) onChanged;

  const UnitCompositionEditor({
    super.key,
    required this.composition,
    required this.onChanged,
  });

  @override
  State<UnitCompositionEditor> createState() => _UnitCompositionEditorState();
}

class _UnitCompositionEditorState extends State<UnitCompositionEditor> {
  late Map<String, int> _selectedCounts;
  late int _totalModels;
  late int _totalCost;

  @override
  void initState() {
    super.initState();
    _initializeCounts();
  }

  void _initializeCounts() {
    _selectedCounts = {};
    for (var component in widget.composition.components) {
      _selectedCounts[component.name] = component.minCount;
    }
    _updateTotals();
  }

  void _updateTotals() {
    _totalModels = 0;
    _totalCost = 0;

    for (var component in widget.composition.components) {
      final count = _selectedCounts[component.name] ?? 0;
      _totalModels += count;
      _totalCost += count * component.costPerModel;
    }

    print('📊 Updated totals: $_totalModels models, $_totalCost pts');

    widget.onChanged(_selectedCounts);
  }

  void _increment(String componentName, int maxCount) {
    if (_totalModels < widget.composition.maxModels) {
      setState(() {
        _selectedCounts[componentName] =
            (_selectedCounts[componentName] ?? 0) + 1;
        _updateTotals();
      });
    }
  }

  void _decrement(String componentName) {
    setState(() {
      final current = _selectedCounts[componentName] ?? 0;
      if (current > 0) {
        _selectedCounts[componentName] = current - 1;
        _updateTotals();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок с информацией о лимитах
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Models: $_totalModels / ${widget.composition.maxModels}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Total: $_totalCost pts',
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Список компонентов
        ...widget.composition.components.map((component) {
          final count = _selectedCounts[component.name] ?? 0;

          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: component.isRequired
                    ? Colors.amber
                    : Colors.amber.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            component.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: component.isRequired
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${component.costPerModel} pts per model',
                            style: TextStyle(
                              color: Colors.amber.shade300,
                              fontSize: 12,
                            ),
                          ),
                        ],
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
                            onTap: count > component.minCount
                                ? () => _decrement(component.name)
                                : null,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.remove,
                                color: count > component.minCount
                                    ? Colors.amber
                                    : Colors.grey[600],
                                size: 18,
                              ),
                            ),
                          ),

                          // Количество
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              count.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          // Кнопка плюс
                          InkWell(
                            onTap:
                                _totalModels < widget.composition.maxModels &&
                                        count < component.maxCount
                                    ? () => _increment(
                                        component.name, component.maxCount)
                                    : null,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.add,
                                color: _totalModels <
                                            widget.composition.maxModels &&
                                        count < component.maxCount
                                    ? Colors.amber
                                    : Colors.grey[600],
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Информация о лимитах компонента
                if (component.minCount > 0 || component.maxCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.amber.shade300,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Min: ${component.minCount}, Max: ${component.maxCount}',
                          style: TextStyle(
                            color: Colors.amber.shade300,
                            fontSize: 11,
                          ),
                        ),
                      ],
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
