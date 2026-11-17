import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substructure_daily/ui/widgets/app_drawer.dart';

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
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        title: Text(
          'SUB-STRUCTURE DAILY',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Builder(
            builder: (context) => AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                child: const Icon(Icons.menu, color: Colors.white),
                onTap: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ),
        ],
      ),
      endDrawer: AppDrawer('/'),
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
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    sliver: _TasksSliverList(requiredTasks),
                  ),
                ),
                SliverCrossAxisExpanded(
                  flex: 1,
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(left: 4, right: 8),
                    sliver: _TasksSliverList(incentiveTasks),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                child: const Text('Tasks'),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              sliver: _TasksSliverList(tasks),
            ),
            SliverToBoxAdapter(child: AddTaskWidget()),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            heightFactor: 1.0,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "SCORE",
                  style: TextStyle(
                    fontSize: 44,
                    height: 0,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ),
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
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TaskWidget(tasks[index]),
      );
    },
  );
}
