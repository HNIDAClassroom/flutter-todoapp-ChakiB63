import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});

  final void Function(Task task) onAddTask;
  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  Category _selectedCategory = Category.personal;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre et la description de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddTask(
      Task(
          title: _titleController.text,
          description: _descriptionController.text,
          date: DateTime(2023, 10, 16, 14, 30),
          category: _selectedCategory),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _descriptionController,
                  maxLength: 200,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DropdownButton<Category>(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem<Category>(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  // Enregistrez les données ici ou effectuez l'action appropriée
                  _submitTaskData();
                  //Navigator.pop(context); // Ferme le ModalBottomSheet après l'enregistrement
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
