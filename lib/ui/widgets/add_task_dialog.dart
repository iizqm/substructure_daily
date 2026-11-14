import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substructure_daily/cubits/prefab/prefab_cubit.dart';

import '../../models/value_prefab.dart';
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
  ValuePrefab? selectedPrefab;

  @override
  Widget build(BuildContext context) {
    final prefabs = context
        .select((PrefabCubit cubit) => cubit.state.prefabs)
        .where((prefab) => (prefab.type == selectedType))
        .toList();

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320, maxHeight: 420),
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
                if (prefabs.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('Нет префабов для этого типа'),
                  )
                else
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: prefabs.length,
                      itemBuilder: (context, index) {
                        final prefab = prefabs[index];
                        final isSelected = selectedPrefab?.id == prefab.id;
                        return ListTile(
                          selected: isSelected,
                          title: Text(prefab.title),
                          subtitle: Text(
                            prefab.subValue > 0
                                ? '${prefab.value} / ${prefab.subValue}'
                                : '${prefab.value}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: prefab == selectedPrefab
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: prefab == selectedPrefab
                                  ? Colors.black
                                  : Colors.blueGrey,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedPrefab = prefab;
                            });
                          },
                        );
                      },
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    if (selectedPrefab != null) {
                      context.read<TodayCubit>().addTask(
                        title: widget.taskTitle,
                        type: selectedType,
                        value: selectedPrefab!.value,
                        subValue: selectedPrefab!.subValue,
                      );
                      widget.textEditingController.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
