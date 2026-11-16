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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(fontSize: 18, height: 1.0),
                cursorColor: Colors.yellow,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 0,
                  ),
                  hintText: "Task Title",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                controller: _textEditingController,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
            child: AspectRatio(
              aspectRatio: 1,
              child: _AddTaskButton(_textEditingController),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

class _AddTaskButton extends StatelessWidget {
  final TextEditingController textEditingController;
  const _AddTaskButton(this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: textEditingController,
      builder: (context, value, child) {
        final bool isActive = value.text.trim().isNotEmpty;

        return GestureDetector(
          onTap: isActive
              ? () => _openAddTaskDialog(context, textEditingController)
              : null,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isActive ? Colors.white : Colors.grey,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.add,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}

void _openAddTaskDialog(
  BuildContext context,
  TextEditingController textEditingController,
) {
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
              taskTitle: textEditingController.text,
              textEditingController: textEditingController,
            ),
          ),
        ),
      );
    },
  );
}
