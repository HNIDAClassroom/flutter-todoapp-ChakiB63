import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';
import 'package:intl/intl.dart';

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
  DateTime _dateController = DateTime.now().add(const Duration(days: 1));
  final _dateController2 = TextEditingController();

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateController,
      firstDate: _dateController,
      lastDate: DateTime(2100),
    );
    if (picked != _dateController) {
      setState(() {
        _dateController = picked!;
        _dateController2.text =
            DateFormat('yyyy-MM-dd').format(_dateController);
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _submitTaskData() {
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
      return false;
    }
    widget.onAddTask(
      Task(
          //id: 0,
          title: _titleController.text,
          description: _descriptionController.text,
          date: _dateController,
          category: _selectedCategory,
          completion: false,
          docId: ''),
    );
    return true;
  }

  void showSuccessAlert(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Utilisation de Timer pour faire disparaître automatiquement le SnackBar après 1 seconde
    Timer(Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _descriptionController,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _dateController2,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                  ),
                  onTap: () => _selectDate2(context),
                  readOnly:
                      true, // Prevents the user from typing into the field.
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
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
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  bool t = _submitTaskData() ? true : false;
                  if (t) {
                    Navigator.pop(context);
                    showSuccessAlert(
                        context, "La tâche est ajoutée. Au travail !");
                  }
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
