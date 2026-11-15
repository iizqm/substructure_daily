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
        constraints: const BoxConstraints(maxWidth: 320, maxHeight: 320),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 37, 37, 37),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.white, width: 2),
          ),
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
                  const Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('No prefabs for this type'),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: prefabs.length,
                        itemBuilder: (context, index) {
                          final prefab = prefabs[index];
                          final isSelected = selectedPrefab?.id == prefab.id;
                          return GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              color: isSelected
                                  ? const Color.fromARGB(255, 49, 49, 49)
                                  : Colors.transparent,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      prefab.title,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    prefab.subValue > 0
                                        ? '+${prefab.value.round()} +(${prefab.subValue.round()})'
                                        : '+${prefab.value.round()}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
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
                  ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: selectedPrefab != null
                            ? Colors.white
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                        color: selectedPrefab != null
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
