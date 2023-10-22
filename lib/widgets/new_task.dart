import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _categoryController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _categoryController,
            maxLength: 30,
            decoration: InputDecoration(
              labelText: 'Category',
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _descriptionController,
            maxLength: 200,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
          SizedBox(height: 12),
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
    );
  }
}
