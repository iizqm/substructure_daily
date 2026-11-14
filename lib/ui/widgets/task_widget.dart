import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/today/today_cubit.dart';
import '../../models/task_type.dart';
import '../../models/item_task.dart';

class TaskWidget extends StatelessWidget {
  final ItemTask itemTask;

  const TaskWidget(this.itemTask, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(itemTask.title)),
        itemTask.type == TaskType.checkable
            ? IconButton(
                onPressed: () {
                  context.read<TodayCubit>().toggleTask(itemTask);
                },
                icon: itemTask.isCompleted
                    ? Icon(Icons.circle)
                    : Icon(Icons.circle_outlined),
              )
            : Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<TodayCubit>().decrementCount(itemTask);
                    },
                    icon: Icon(Icons.arrow_left),
                  ),
                  Text(itemTask.count.toString()),
                  IconButton(
                    onPressed: () {
                      context.read<TodayCubit>().incrementCount(itemTask);
                    },
                    icon: Icon(Icons.arrow_right),
                  ),
                ],
              ),
      ],
    );
  }
}
