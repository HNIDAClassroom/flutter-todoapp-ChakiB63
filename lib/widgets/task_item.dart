import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';

class TaskItem extends StatefulWidget {
  const TaskItem(
      {required this.task,
      super.key,
      required this.ddeleteTask,
      required this.uupdateTaskCompletion});

  final void Function(Task task) ddeleteTask;

  final void Function(Task task, bool newCompletionValue) uupdateTaskCompletion;

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItem();
}

class _TaskItem extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRect(
            child: Dismissible(
          key: Key(widget.task.docId),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            bool confirm = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirmer la suppression'),
                  content: const Text(
                      'Voulez-vous vraiment supprimer cette tâche ?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(false); // Annuler la suppression
                      },
                      child: const Text('Annuler'),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.ddeleteTask(widget.task);
                        Navigator.of(context)
                            .pop(true); // Confirmer la suppression
                      },
                      child: const Text('Supprimer'),
                    ),
                  ],
                );
              },
            );

            return confirm;
          },
          background: Container(
            color: Colors
                .red, // Couleur de l'arrière-plan lors du glissement vers la gauche (supprimer, par exemple)
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(Icons.delete,
                color: Colors.white), // Icône pour supprimer
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: widget.task.completion,
                      onChanged: (newValue) {
                        setState(() {
                          widget.task.completion = newValue!;
                          widget.uupdateTaskCompletion(
                              widget.task, widget.task.completion);
                        });
                      },
                    ),
                    Text(
                      '[ ${widget.task.category.name.toUpperCase()} ] : ${widget.task.title} ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: widget.task.completion
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.task.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    decoration: widget.task.completion
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.task.date.day} - ${widget.task.date.month} - ${widget.task.date.year}',
                        textAlign: TextAlign
                            .end, // Aligns the text to the end (right) of the line
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 121, 191, 248),
                          decoration: widget.task.completion
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
