import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/task_widget.dart';
import '../../cubits/today/today_cubit.dart';
import '../widgets/add_task_widget.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Блок 1'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Блок 1'),
                    ),
                  ),
                ],
              ),
            ),
            const _TasksSliverList(),
            SliverToBoxAdapter(child: AddTaskWidget()),
          ],
        ),
      ),
    );
  }
}

class _TasksSliverList extends StatelessWidget {
  const _TasksSliverList();

  @override
  Widget build(BuildContext context) {
    final tasks = context.select((TodayCubit cubit) => cubit.state.tasks);

    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(title: TaskWidget(task));
      },
    );
  }
}
