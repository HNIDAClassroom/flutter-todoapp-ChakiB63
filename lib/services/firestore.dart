import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class FirestoreService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(Task task) {
    return tasks.add(
      {
        'taskTitle': task.title.toString(),
        'taskDesc': task.description.toString(),
        'taskCategory': task.category.name.toString(),
        'taskDate': DateFormat('yyyy-MM-dd').format(task.date),
        'taskComplet': task.completion,
      },
    );
  }

  Future<void> deleteTask(String taskDocId) {
    return tasks.doc(taskDocId).delete();
  }

  Future<void> updateTaskCompletion(String taskDocId, bool newCompletionValue) {
    return tasks.doc(taskDocId).update({
      'taskComplet': newCompletionValue,
    });
  }

  Stream<QuerySnapshot> getTasks() {
    final taskStream = tasks.snapshots();
    return taskStream;
  }
}
