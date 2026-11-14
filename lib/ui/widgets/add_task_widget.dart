import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/prefab/prefab_cubit.dart';
import '../../cubits/today/today_cubit.dart';
import 'add_task_dialog.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  void openAddTaskDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      pageBuilder: (dialogContext, _, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<TodayCubit>()),
            BlocProvider.value(value: context.read<PrefabCubit>()),
          ],
          child: Center(
            child: Material(
              type: MaterialType.transparency,
              child: AddTaskDialog(
                taskTitle: _textEditingController.text,
                textEditingController: _textEditingController,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
              controller: _textEditingController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsGeometry.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              openAddTaskDialog(context);
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
