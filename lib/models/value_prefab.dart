import 'package:isar/isar.dart';
import 'task_type.dart';

part 'value_prefab.g.dart';

@collection
class ValuePrefab {
  Id id = Isar.autoIncrement;

  late String title;

  @enumerated
  late TaskType type;

  late double value;
  double subValue = 0.0;
}
