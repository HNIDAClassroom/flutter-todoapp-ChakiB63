import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[ ${task.category.name.toString().toUpperCase()} ] : ${task.title.toString()}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              task.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${task.date}',
                    textAlign: TextAlign
                        .end, // Aligns the text to the end (right) of the line
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 121, 191, 248),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
