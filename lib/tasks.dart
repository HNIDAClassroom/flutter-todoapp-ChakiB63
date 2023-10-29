import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';
import 'package:tp3/task_list.dart';
import 'package:tp3/widgets/new_task.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final List<Task> _registeredTasks = [
    Task(
      title: 'Apprendre Flutter',
      description: 'Suivre le cours pour apprendre de nouvelles compétences',
      date: DateTime.now(),
      category: Category.work,
    ),
    Task(
      title: 'Faire les courses',
      description: 'Acheter des provisions pour la semaine',
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: Category.shopping,
    ),
    Task(
      title: 'Soumettre le projet',
      description: 'TO DO List',
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: Category.personal,
    ),
    // Add more tasks with descriptions as needed
  ];

  Future<void> _addTask(Task task) async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _registeredTasks.add(task);
    });
  }

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ToDoList'),
        /*
        actions: [
          IconButton(
            onPressed: _openAddTaskOverlay,
            icon: const Icon(Icons.add),
          ),
        ],*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskOverlay,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(child: TasksList(tasks: _registeredTasks)),
        ],
      ),
    );
  }
}
