// lib/models/unit_composition.dart

class UnitComposition {
  final int datasheetId;
  final List<UnitComponent>
      components; // компоненты юнита (Boss Nob, Boyz и т.д.)
  final int minModels; // минимальное количество моделей
  final int maxModels; // максимальное количество моделей

  UnitComposition({
    required this.datasheetId,
    required this.components,
    required this.minModels,
    required this.maxModels,
  });
}

class UnitComponent {
  final String name; // название компонента (Boss Nob, Boyz)
  final int minCount; // минимальное количество
  final int maxCount; // максимальное количество
  final int? fixedCount; // фиксированное количество (если есть)
  final int costPerModel; // стоимость за модель

  UnitComponent({
    required this.name,
    required this.minCount,
    required this.maxCount,
    this.fixedCount,
    required this.costPerModel,
  });

  // Является ли компонент обязательным
  bool get isRequired => minCount > 0;

  // Является ли компонент опциональным
  bool get isOptional => minCount == 0 && maxCount > 0;
}
