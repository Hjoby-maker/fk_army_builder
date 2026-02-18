// Версии
const String appVersion = '1.0.0';
const String buildNumber = '1';
const String rulesEdition = '10th Edition';

// API
const String csvBaseUrl = 'http://wahapedia.ru/wh40k10ed';

// Глобальный список CSV файлов для загрузки
const List<String> csvFiles = [
  'Factions.csv', //1
  'Abilities.csv', //1
  'Datasheets.csv', //1
  'Datasheets_abilities.csv', //11
  'Datasheets_detachment_abilities.csv', //1
  'Datasheets_enhancements.csv', //1
  'Datasheets_keywords.csv', //1
  'Datasheets_leader.csv', //1
  'Datasheets_models.csv', //1
  'Datasheets_models_cost.csv', //1
  'Datasheets_options.csv', //1
  'Datasheets_stratagems.csv', //1
  'Datasheets_unit_composition.csv', //1
  'Datasheets_wargear.csv', //1
  'Detachments.csv', //1
  'Detachment_abilities.csv', //1
  'Enhancements.csv', //1
  'Last_update.csv', //1
  'Source.csv', //1
  'Stratagems.csv', //1
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
  'Space Marines': 0xFF2196F3, // Blue
  'Astra Militarum': 0xFF795548, // Brown
  'Adeptus Mechanicus': 0xFF607D8B, // Blue Grey
  'Adepta Sororitas': 0xFFE91E63, // Pink
  'Adeptus Custodes': 0xFFFFC107, // Amber
  'Imperial Knights': 0xFF9C27B0, // Purple
  'Aeldari': 0xFF9C27B0, // Purple
  'Drukhari': 0xFF673AB7, // Deep Purple
  'Harlequins': 0xFF00BCD4, // Cyan
  'Necrons': 0xFF009688, // Teal
  'Orks': 0xFF4CAF50, // Green
  'T\'au Empire': 0xFF3F51B5, // Indigo
  'Tyranids': 0xFFF44336, // Red
  'Genestealer Cults': 0xFF9E9E9E, // Grey
  'Leagues of Votann': 0xFFFF9800, // Orange
  'Chaos Space Marines': 0xFFD32F2F, // Red
  'Death Guard': 0xFF388E3C, // Dark Green
  'Thousand Sons': 0xFF512DA8, // Deep Purple
  'World Eaters': 0xFFC2185B, // Pink
  'Chaos Knights': 0xFF7B1FA2, // Purple
  'Chaos Daemons': 0xFFE91E63, // Pink
  'Grey Knights': 0xFF607D8B, // Blue Grey
};
const List<List<String>> csvTable = [
  ['Imperium', 'Imperial Agents', 'AoI'],
  ['Imperium', 'Astra Militarum', 'AM'],
  ['Xenos', 'Genestealer Cults', 'GC'],
  ['Xenos', 'Necrons', 'NEC'],
  ['Xenos', 'Aeldari', 'AE'],
  ['Imperium', 'Adeptus Titanicus', 'TL'],
  ['Xenos', 'Orks', 'ORK'],
  ['Unaligned', 'Unaligned Forces', 'UN'],
  ['Imperium', 'Grey Knights', 'GK'],
  ['Xenos', 'T`au Empire', 'TAU'],
  ['Xenos', 'Leagues of Votann', 'LoV'],
  ['Imperium', 'Adeptus Mechanicus', 'AdM'],
  ['Chaos', 'Thousand Sons', 'TS'],
  ['Chaos', 'Death Guard', 'DG'],
  ['Chaos', 'Emperor`s Children', 'EC'],
  ['Chaos', 'World Eaters', 'WE'],
  ['Chaos', 'Chaos Knights', 'QT'],
  ['Chaos', 'Chaos Daemons', 'CD'],
  ['Imperium', 'Imperial Knights', 'QI'],
  ['Imperium', 'Space Marines', 'SM'],
  ['Xenos', 'Tyranids', 'TYR'],
  ['Imperium', 'Adeptus Custodes', 'AC'],
  ['Imperium', 'Adepta Sororitas', 'AS'],
  ['Chaos', 'Chaos Space Marines', 'CSM'],
  ['Xenos', 'Drukhari', 'DRU'],
];
const List<String> modelObject = [
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
