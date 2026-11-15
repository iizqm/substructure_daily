import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc_observer.dart';
import 'ui/screens/today_screen.dart';
import 'data/isar_service.dart';
import 'data/prefab_repository.dart';
import 'data/task_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  final isarService = IsarService();
  await isarService.init();

  final taskRepository = TaskRepository(isarService.isar);
  final prefabRepository = PrefabRepository(isarService.isar);

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ticketing',
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          fontFamily: 'Ticketing',
        ),
      ),
      home: TodayScreen(
        taskRepository: taskRepository,
        prefabRepository: prefabRepository,
      ),
    ),
  );
}
