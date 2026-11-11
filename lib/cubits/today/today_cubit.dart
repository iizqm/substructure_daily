import 'package:bloc/bloc.dart';

import '../../data/task_repository.dart';
import '../../models/task_type.dart';
import '../../models/item_task.dart';
import 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  final TaskRepository _repository;

  TodayCubit(this._repository) : super(const TodayState());

  Future<void> loadTasks() async {
    try {
      final todayTasks = await _repository.loadTodayTasks();
      emit(
        state.copyWith(
          status: TodayStatus.success,
          requiredTasks: todayTasks
              .where((t) => t.type == TaskType.required)
              .toList(),
          incentiveTasks: todayTasks
              .where((t) => t.type == TaskType.incentive)
              .toList(),
          tasks: todayTasks
              .where(
                (t) =>
                    t.type != TaskType.required && t.type != TaskType.incentive,
              )
              .toList(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: TodayStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> addTask({
    required String title,
    required TaskType type,
    required double value,
    double? subValue,
  }) async {
    final task = ItemTask()
      ..title = title
      ..type = type
      ..value = value
      ..subValue = (subValue != null && subValue > 0) ? subValue : 0
      ..assignedDate = DateTime.now();

    try {
      await _repository.saveTask(task);
      await loadTasks();
    } catch (e) {
      emit(
        state.copyWith(status: TodayStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> removeTask(ItemTask itemTask) async {
    try {
      await _repository.removeTask(itemTask);
      await loadTasks();
    } catch (e) {
      emit(
        state.copyWith(status: TodayStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> toggleTask(ItemTask itemTask) async {
    itemTask.isCompleted = !itemTask.isCompleted;
    itemTask.closedDate = itemTask.isCompleted ? DateTime.now() : null;
    try {
      await _repository.saveTask(itemTask);
      await loadTasks();
    } catch (e) {
      emit(
        state.copyWith(status: TodayStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> setCount(ItemTask itemTask, int count) async {
    if (count < 0 || itemTask.count == count) return;

    itemTask.count = count;
    itemTask.closedDate = itemTask.count > 0 ? DateTime.now() : null;
    try {
      await _repository.saveTask(itemTask);
      await loadTasks();
    } catch (e) {
      emit(
        state.copyWith(status: TodayStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> incrementCount(ItemTask itemTask) =>
      setCount(itemTask, itemTask.count + 1);

  Future<void> decrementCount(ItemTask itemTask) =>
      setCount(itemTask, itemTask.count - 1);
}
