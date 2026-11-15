import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item_task.dart';
import '../widgets/task_widget.dart';
import '../../cubits/today/today_cubit.dart';
import '../widgets/add_task_widget.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    final requiredTasks = context.select(
      (TodayCubit cubit) => cubit.state.requiredTasks,
    );
    final incentiveTasks = context.select(
      (TodayCubit cubit) => cubit.state.incentiveTasks,
    );
    final tasks = context.select((TodayCubit cubit) => cubit.state.tasks);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text('required'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text('incentive'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverCrossAxisGroup(
              slivers: [
                SliverCrossAxisExpanded(
                  flex: 1,
                  sliver: _TasksSliverList(requiredTasks),
                ),
                SliverCrossAxisExpanded(
                  flex: 1,
                  sliver: _TasksSliverList(incentiveTasks),
                ),
              ],
            ),
            _TasksSliverList(tasks),
            SliverToBoxAdapter(child: AddTaskWidget()),
          ],
        ),
      ),
    );
  }
}

class _TasksSliverList extends StatelessWidget {
  final List<ItemTask> tasks;
  const _TasksSliverList(this.tasks);

  @override
  Widget build(BuildContext context) => SliverList.builder(
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final task = tasks[index];
      return ListTile(title: TaskWidget(task));
    },
  );
}
