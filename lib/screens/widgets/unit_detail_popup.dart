// lib/screens/widgets/unit_detail_popup.dart
import 'package:flutter/material.dart';
import '../../database/queries/cross_table_queries.dart';

class UnitDetailPopup extends StatelessWidget {
  final UnitSummary unit;

  const UnitDetailPopup({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
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
                  const Icon(Icons.info_outline, color: Colors.amber),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      unit.datasheet.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Детальная информация
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Роль', unit.role ?? 'Не указана'),
                    _buildInfoRow('Стоимость', unit.costString),

                    const SizedBox(height: 16),
                    const Divider(color: Colors.amber),

                    // Ключевые слова
                    if (unit.keywords.isNotEmpty) ...[
                      const Text(
                        'Ключевые слова:',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: unit.keywords.map((keyword) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.amber.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              keyword.keyword ?? '',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          );
                        }).toList(),
                      ),
                    ],

                    const SizedBox(height: 16),
                    const Divider(color: Colors.amber),

                    // Стоимость моделей
                    if (unit.costs.isNotEmpty) ...[
                      const Text(
                        'Стоимость моделей:',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...unit.costs.map((cost) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  cost.description ?? 'Модель ${cost.line}',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ),
                              const SizedBox(width: 8),
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
                      }).toList(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
