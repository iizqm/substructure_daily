import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:substructure_daily/cubits/prefab/prefab_cubit.dart';
import 'package:substructure_daily/data/prefab_repository.dart';
import 'package:substructure_daily/data/task_repository.dart';
import 'settings_view.dart';

class SettingsScreen extends StatelessWidget {
  final TaskRepository taskRepository;
  final PrefabRepository prefabRepository;

  const SettingsScreen({
    super.key,
    required this.taskRepository,
    required this.prefabRepository,
  });

  @override
  Widget build(BuildContext contaxt) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PrefabCubit(prefabRepository)..loadPrefabs(),
        ),
      ],
      child: SettingsView(),
    );
  }
}
