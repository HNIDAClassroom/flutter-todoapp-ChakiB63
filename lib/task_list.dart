import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;

  const TasksList({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Text(tasks[index].title),
    );
  }
}