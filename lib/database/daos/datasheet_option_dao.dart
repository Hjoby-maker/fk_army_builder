import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/tIndex.dart';
import 'package:fk_army_builder/models/index.dart' as models;

part 'datasheet_option_dao.g.dart';

@DriftAccessor(tables: [Tdatasheetoption])
class DatasheetOptionDao extends DatabaseAccessor<AppDatabase>
    with _$DatasheetOptionDaoMixin {
  DatasheetOptionDao(AppDatabase db) : super(db);

  // CRUD
  Future<List<TdatasheetoptionData>> getAllOptions() =>
      select(tdatasheetoption).get();

  Future<List<TdatasheetoptionData>> getOptionsByDatasheetIdAndLine(
          int datasheetId, int line) =>
      (select(tdatasheetoption)
            ..where(
                (t) => t.datasheetId.equals(datasheetId) & t.line.equals(line)))
          .get();

  Future<void> insertAllOptions(List<TdatasheetoptionCompanion> optionsList) =>
      batch((batch) {
        batch.insertAllOnConflictUpdate(tdatasheetoption, optionsList);
      });

  Future<int> deleteOptionsByDatasheet(int datasheetId, int line) => (delete(
          tdatasheetoption)
        ..where((t) => t.datasheetId.equals(datasheetId) & t.line.equals(line)))
      .go();

  // Конвертация в модели
  Future<List<models.DatasheetOption>> getAllOptionModels() async {
    final data = await getAllOptions();
    return data
        .map((o) => models.DatasheetOption(
              datasheetId: o.datasheetId,
              line: o.line,
              button: o.button,
              description: o.description,
            ))
        .toList();
  }

  Future<void> debugLenTdatasheetOption() async {
    final row_count =
        await customSelect('select count(*) as count_ from tdatasheetoption;')
            .get();
    // row.data – Map<String, dynamic>
    for (final _row in row_count) {
      print('Tdatasheetoption count: ${_row.data['count_']} ');
    }
  }
}
