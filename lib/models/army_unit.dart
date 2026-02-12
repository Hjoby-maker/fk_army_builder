// lib/models/army_unit.dart
import '../models/index.dart';

class ArmyUnit {
  final String id;
  final Datasheet datasheet;
  final List<String> selectedOptions;
  final List<DatasheetWargear> selectedWargear;
  final DateTime addedAt;
  
  ArmyUnit({
    required this.id,
    required this.datasheet,
    this.selectedOptions = const [],
    this.selectedWargear = const [],
  }) : addedAt = DateTime.now();

  factory ArmyUnit.fromDatasheet({
    required Datasheet datasheet,
    List<String> selectedOptions = const [],
  }) {
    return ArmyUnit(
      id: '${datasheet.id}_${DateTime.now().millisecondsSinceEpoch}',
      datasheet: datasheet,
      selectedOptions: selectedOptions,
    );
  }

  // Стоимость юнита с учетом выбранных опций
  int get points {
    int basePoints = 0 ; //datasheet.;
    
    // TODO: Добавить стоимость выбранных опций вооружения
    /*for (final wargear in selectedWargear) {
      basePoints += 1 ; //wargear.estimatedPoints;
    }*/
    
    return basePoints;
  }

  // Основные характеристики для отображения в списке
  String get displayName => datasheet.name;
  String get role => "";//datasheet.role.displayName;
  
  // Строка с выбранными опциями
  String get optionsString {
    if (selectedOptions.isEmpty) return '';
    return selectedOptions.join(', ');
  }
}