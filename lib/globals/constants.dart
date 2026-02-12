
  // Версии
  const String appVersion = '1.0.0';
  const String buildNumber = '1';
  const String rulesEdition = '10th Edition';
  
  // API
  const String csvBaseUrl = 'http://wahapedia.ru/wh40k10ed';
  
  // Глобальный список CSV файлов для загрузки
  const  List<String> csvFiles = [
    'Factions.csv',
    'Abilities.csv',
    'Datasheets.csv',
    'Datasheets_abilities.csv',
    'Datasheets_detachment_abilities.csv',
    'Datasheets_enhancements.csv',
    'Datasheets_keywords.csv',
    'Datasheets_leader.csv',
    'Datasheets_models.csv',
    'Datasheets_models_cost.csv',
    'Datasheets_options.csv',
    'Datasheets_stratagems.csv',
    'Datasheets_unit_composition.csv',
    'Datasheets_wargear.csv',
    'Detachments.csv',
    'Detachment_abilities.csv',
    'Enhancements.csv',
    'Last_update.csv',
    'Source.csv',
    'Stratagems.csv',
  ];
  
  // Пути
  const String appDocumentsDir = 'wh40k_army_builder';
  const String armiesSubdir = 'armies';
  const String exportsSubdir = 'exports';
  
  // Лимиты
  const int maxPointsDefault = 2000;
  const int maxDetachments = 3;
  const int maxSavedArmiesFree = 10;
  
  // Форматы даты
  const String dateFormat = 'dd.MM.yyyy';
  const String dateTimeFormat = 'dd.MM.yyyy HH:mm';
  
  // Цвета фракций
  const Map<String, int> factionColors = {
    'Space Marines': 0xFF2196F3,     // Blue
    'Astra Militarum': 0xFF795548,   // Brown
    'Adeptus Mechanicus': 0xFF607D8B,// Blue Grey
    'Adepta Sororitas': 0xFFE91E63,  // Pink
    'Adeptus Custodes': 0xFFFFC107,  // Amber
    'Imperial Knights': 0xFF9C27B0,  // Purple
    'Aeldari': 0xFF9C27B0,           // Purple
    'Drukhari': 0xFF673AB7,          // Deep Purple
    'Harlequins': 0xFF00BCD4,        // Cyan
    'Necrons': 0xFF009688,           // Teal
    'Orks': 0xFF4CAF50,              // Green
    'T\'au Empire': 0xFF3F51B5,      // Indigo
    'Tyranids': 0xFFF44336,          // Red
    'Genestealer Cults': 0xFF9E9E9E, // Grey
    'Leagues of Votann': 0xFFFF9800, // Orange
    'Chaos Space Marines': 0xFFD32F2F,// Red
    'Death Guard': 0xFF388E3C,       // Dark Green
    'Thousand Sons': 0xFF512DA8,     // Deep Purple
    'World Eaters': 0xFFC2185B,      // Pink
    'Chaos Knights': 0xFF7B1FA2,     // Purple
    'Chaos Daemons': 0xFFE91E63,     // Pink
    'Grey Knights': 0xFF607D8B,      // Blue Grey
  };
const  List<String> modelObject = [
    'ability',
    'datasheetAbility',
    'datasheetDetachmentAbility',
    'datasheetEnhancement',
    'datasheetKeyword',
    'datasheetLeader',
    'datasheetModelCost',
    'datasheetModel',
    'datasheetOption',
    'datasheetStratagem',
    'datasheetUnitComposition',
    'datasheetWargear',
    'datasheet',
    'detachmentAbility',
    'detachment',
    'enhancement',
    'faction',
    'lastUpdate',
    'source',
    'stratagem',
  ];