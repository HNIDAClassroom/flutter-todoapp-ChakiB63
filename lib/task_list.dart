import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp3/models/task.dart';
import 'package:tp3/services/firestore.dart';
import 'package:tp3/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Loading indicator while data is loading
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text(
                'No tasks available.'); // Display a message when there are no tasks
          }
          final taskLists = snapshot.data!.docs;
          List<Task> taskItems = [];
          for (int index = 0; index < taskLists.length; index++) {
            DocumentSnapshot document = taskLists[index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String title = data['taskTitle'];
            String description = data['taskDesc'];
            DateTime date =
                DateFormat('yyyy-MM-dd HH:mm:ss').parse(data['taskDate']);
            String categoryString = data['taskCategory'];
            Category category;
            switch (categoryString) {
              case 'Category.personal':
                category = Category.personal;
                break;
              case 'Category.work':
                category = Category.work;
                break;
              case 'Category.shopping':
                category = Category.shopping;
                break;
              default:
                category = Category.others;
            }
            Task task = Task(
              title: title,
              description: description,
              date: date,
              category: category,
            );
            taskItems.add(task);
          }
          return ListView.builder(
            itemCount: taskItems.length,
            itemBuilder: (ctx, index) {
              return TaskItem(taskItems[index]);
            },
          );
        });
  }
}
