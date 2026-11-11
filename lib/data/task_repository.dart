import 'package:isar/isar.dart';

import '../models/item_task.dart';

class TaskRepository {
  final Isar isar;

  TaskRepository(this.isar);

  Future<List<ItemTask>> loadTodayTasks() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return isar.itemTasks
        .filter()
        .closedDateIsNull()
        .or()
        .closedDateGreaterThan(today, include: true)
        .findAll();
  }

  Future<void> saveTask(ItemTask itemTask) async {
    await isar.writeTxn(() async {
      await isar.itemTasks.put(itemTask);
    });
  }

  Future<void> removeTask(ItemTask itemTask) async {
    await isar.writeTxn(() async {
      await isar.itemTasks.delete(itemTask.id);
    });
  }
}
