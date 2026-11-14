import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/today/today_cubit.dart';
import 'segmented_switch.dart';
import '../../models/task_type.dart';

class AddTaskDialog extends StatefulWidget {
  final String taskTitle;
  final TextEditingController textEditingController;

  const AddTaskDialog({
    super.key,
    required this.taskTitle,
    required this.textEditingController,
  });

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TaskType selectedType = TaskType.checkable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: [
              SegmentedSwitch<TaskType>(
                segments: const [
                  SegmentItem<TaskType>(
                    value: TaskType.checkable,
                    label: 'Checkable',
                  ),
                  SegmentItem<TaskType>(
                    value: TaskType.countable,
                    label: 'Countable',
                  ),
                ],
                selected: selectedType,
                onSelectionChanged: (TaskType newSelection) {
                  setState(() {
                    selectedType = newSelection;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  context.read<TodayCubit>().addTask(
                    title: widget.taskTitle,
                    type: selectedType,
                    value: 10,
                  );
                  widget.textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
