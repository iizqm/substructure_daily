import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/task_repository.dart';
import 'today_view.dart';
import '../../cubits/today/today_cubit.dart';

class TodayScreen extends StatelessWidget {
  final TaskRepository taskRepository;

  const TodayScreen(this.taskRepository, {super.key});

  @override
  Widget build(BuildContext contaxt) {
    return BlocProvider(
      create: (_) => TodayCubit(taskRepository)..loadTasks(),
      child: TodayView(),
    );
  }
}
