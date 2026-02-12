// lib/models/army.dart
import '../models/index.dart';

class Army {
  String id;
  String name;
  Faction? fraction;
  Detachment? detachment;
  List<ArmyUnit> units = [];
  List<Stratagem> selectedStratagems = [];
  List<Enhancement> selectedEnhancements = [];
  int pointsLimit;
  DateTime createdAt;
  DateTime? updatedAt;

  Army({
    this.id = '',
    this.name = 'New Army',
    this.fraction,
    this.detachment,
    this.pointsLimit = 2000,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Копия армии
  Army copy() {
    return Army(
      id: id,
      name: name,
      fraction: fraction,
      detachment: detachment,
      pointsLimit: pointsLimit,
      createdAt: createdAt,
    )..units = List.from(units);
  }

  // Добавление юнита
  void addUnit(ArmyUnit unit) {
    units.add(unit);
    updatedAt = DateTime.now();
  }

  // Удаление юнита
  void removeUnit(String unitId) {
    units.removeWhere((unit) => unit.id == unitId);
    updatedAt = DateTime.now();
  }

  // Очистка армии
  void clear() {
    units.clear();
    selectedStratagems.clear();
    selectedEnhancements.clear();
    updatedAt = DateTime.now();
  }

  // Общая стоимость
  int get totalPoints {
    int points = 0;
    for (final unit in units) {
      points += unit.points;
    }
    for (final enhancement in selectedEnhancements) {
      points += enhancement.cost;
    }
    return points;
  }

  // Оставшиеся очки
  int get remainingPoints => pointsLimit - totalPoints;

  // Валидность армии
  bool get isValid {
    // Проверяем лимит очков
    if (totalPoints > pointsLimit) return false;
    
    // Проверяем требования childrenтмента (если выбран)
    if (detachment != null) {
      // TODO: Добавить проверку правил childrenтмента
    }
    
    return true;
  }

}