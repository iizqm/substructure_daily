import 'package:isar/isar.dart';
import 'task_type.dart';

part 'item_task.g.dart';

@collection
class ItemTask {
  Id id = Isar.autoIncrement;

  late String title;

  @enumerated
  late TaskType type;

  late double value;
  double subValue = 0.0;

  bool isCompleted = false;
  int count = 0;

  @Index()
  late DateTime assignedDate;

  DateTime? closedDate;

  @ignore
  bool get isDone => type == TaskType.countable ? count > 0 : isCompleted;
}
