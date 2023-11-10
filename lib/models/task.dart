import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { personal, work, shopping, others }

class Task {
  //int id = 0;
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Category category;
  bool completion;
  String docId = '';

  Task(
      { //required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.category,
      required this.completion,
      required this.docId})
      : id = uuid.v4();
}
