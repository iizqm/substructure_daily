import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substructure_daily/ui/screens/settings_screen.dart';

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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/settings':
            page = SettingsScreen(
              taskRepository: taskRepository,
              prefabRepository: prefabRepository,
            );
            break;
          case '/':
          default:
            page = TodayScreen(
              taskRepository: taskRepository,
              prefabRepository: prefabRepository,
            );
        }
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
    ),
  );
}
