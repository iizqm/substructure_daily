import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substructure_daily/cubits/today/today_cubit.dart';

import 'data/isar_service.dart';
import 'data/task_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isarService = IsarService();
  await isarService.init();

  final taskRepository = TaskRepository(isarService.isar);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodayCubit(taskRepository)..loadTasks()),
      ],
      child: const MaterialApp(home: Text("TODO")),
    ),
  );
}
