import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/prefab/prefab_cubit.dart';
import '../../data/prefab_repository.dart';
import '../../data/task_repository.dart';
import 'today_view.dart';
import '../../cubits/today/today_cubit.dart';

class TodayScreen extends StatelessWidget {
  final TaskRepository taskRepository;
  final PrefabRepository prefabRepository;

  const TodayScreen({
    super.key,
    required this.taskRepository,
    required this.prefabRepository,
  });

  @override
  Widget build(BuildContext contaxt) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodayCubit(taskRepository)..loadTasks()),
        BlocProvider(
          create: (_) => PrefabCubit(prefabRepository)..loadPrefabs(),
        ),
      ],
      child: TodayView(),
    );
  }
}
