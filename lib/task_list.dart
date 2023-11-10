import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp3/models/task.dart';
import 'package:tp3/services/firestore.dart';
import 'package:tp3/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();
  //int id = 0;
  TasksList({
    super.key,
  });

  void _deleteTask(Task task) {
    firestoreService.deleteTask(task.docId);
  }

  void _updateTaskCompletion(Task task, bool newCompletionValue) {
    firestoreService.updateTaskCompletion(task.docId, newCompletionValue);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    'No tasks available.',
                  )
                ]));
          }
          final taskLists = snapshot.data!.docs;
          List<Task> taskItems = [];
          for (int index = 0; index < taskLists.length; index++) {
            DocumentSnapshot document = taskLists[index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String title = data['taskTitle'];
            String description = data['taskDesc'];
            DateTime date = DateFormat('yyyy-MM-dd').parse(data['taskDate']);
            String categoryString = data['taskCategory'];
            Category category;
            switch (categoryString) {
              case 'personal':
                category = Category.personal;
                break;
              case 'work':
                category = Category.work;
                break;
              case 'shopping':
                category = Category.shopping;
                break;
              default:
                category = Category.others;
            }
            bool completed = data['taskComplet'];
            //id++;
            Task task = Task(
              //id: id,
              title: title,
              description: description,
              date: date,
              category: category,
              completion: completed,
              docId: document.id,
            );
            taskItems.add(task);
          }
          return ListView.builder(
            itemCount: taskItems.length,
            itemBuilder: (ctx, index) {
              return TaskItem(
                  task: taskItems[index],
                  ddeleteTask: _deleteTask,
                  uupdateTaskCompletion: _updateTaskCompletion);
            },
          );
        });
  }
}
