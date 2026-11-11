import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/day_progress.dart';
import '../models/item_task.dart';
import '../models/value_prefab.dart';

class IsarService {
  late final Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [ItemTaskSchema, DayProgressSchema, ValuePrefabSchema],
      directory: dir.path,
      name: 'substructure_daily_db',
    );
  }
}
