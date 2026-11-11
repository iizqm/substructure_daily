import '../../models/item_task.dart';

enum TodayStatus { initial, loading, success, failure }

class TodayState {
  final TodayStatus status;
  final List<ItemTask> requiredTasks;
  final List<ItemTask> incentiveTasks;
  final List<ItemTask> tasks;
  final String? errorMessage;

  const TodayState({
    this.status = TodayStatus.initial,
    this.requiredTasks = const [],
    this.incentiveTasks = const [],
    this.tasks = const [],
    this.errorMessage,
  });

  TodayState copyWith({
    TodayStatus? status,
    List<ItemTask>? requiredTasks,
    List<ItemTask>? incentiveTasks,
    List<ItemTask>? tasks,
    String? errorMessage,
  }) {
    return TodayState(
      status: status ?? this.status,
      requiredTasks: requiredTasks ?? this.requiredTasks,
      incentiveTasks: incentiveTasks ?? this.incentiveTasks,
      tasks: tasks ?? this.tasks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
