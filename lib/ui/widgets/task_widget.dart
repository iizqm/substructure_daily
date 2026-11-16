import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/num_extensions.dart';
import '../../cubits/today/today_cubit.dart';
import '../../models/task_type.dart';
import '../../models/item_task.dart';

class TaskWidget extends StatelessWidget {
  final ItemTask itemTask;

  const TaskWidget(this.itemTask, {super.key});

  @override
  Widget build(BuildContext context) {
    return switch (itemTask.type) {
      TaskType.required || TaskType.incentive => _ActionTaskCard(itemTask),
      TaskType.checkable => _CheckableTaskCard(itemTask),
      TaskType.countable => _CountableTaskCard(itemTask),
    };
  }
}

class _ActionTaskCard extends StatelessWidget {
  final ItemTask itemTask;
  const _ActionTaskCard(this.itemTask);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: BoxBorder.all(color: Colors.white, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _TaskTitle(itemTask.title)),
                  _TaskValue(itemTask.value.toMultiplier()),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: itemTask.isDone
                    ? const Color.fromARGB(255, 19, 114, 62)
                    : (itemTask.type == TaskType.required
                          ? const Color.fromARGB(255, 126, 20, 20)
                          : const Color.fromARGB(255, 112, 106, 26)),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  itemTask.isDone ? "COMPLETED" : "COMPLETE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'm3x6',
                    fontSize: 32,
                    height: 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => context.read<TodayCubit>().toggleTask(itemTask),
    );
  }
}

class _CheckableTaskCard extends StatelessWidget {
  final ItemTask itemTask;
  const _CheckableTaskCard(this.itemTask);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color.fromARGB(255, 122, 34, 27),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
          ),
          Dismissible(
            key: ValueKey(itemTask.id),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              context.read<TodayCubit>().removeTask(itemTask);
            },
            child: GestureDetector(
              onTap: () => context.read<TodayCubit>().toggleTask(itemTask),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  // Обязательно непрозрачный фон, иначе подложка будет видна сквозь карточку
                  color: const Color.fromARGB(255, 37, 37, 37),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 6.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TaskTitle(itemTask.title),
                            _TaskValue('+${itemTask.value.round()}'),
                          ],
                        ),
                      ),
                      _CheckMark(itemTask.isDone),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountableTaskCard extends StatelessWidget {
  final ItemTask itemTask;
  const _CountableTaskCard(this.itemTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: BoxBorder.all(color: Colors.white, width: 2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TaskTitle(itemTask.title),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      '+${itemTask.value.round()} (+${itemTask.subValue.round()})',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: itemTask.isDone ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckMark extends StatelessWidget {
  final bool isDone;
  const _CheckMark(this.isDone);

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(left: 10, right: 5),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: isDone ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
      ),
    ),
  );
}

class _TaskTitle extends StatelessWidget {
  final String title;
  const _TaskTitle(this.title);

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(right: 4),
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16, height: 1.3),
    ),
  );
}

class _TaskValue extends StatelessWidget {
  final String value;
  const _TaskValue(this.value);

  @override
  Widget build(BuildContext context) =>
      Text(value, style: TextStyle(color: Colors.grey.shade500));
}
