import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/presentation/provider/tasks_provider.dart';

class CreateTaskDialog extends StatelessWidget {
  const CreateTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    return AlertDialog(
      title: const Text('Create Task'),
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextField(
            controller: descController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              context.read<TasksProvider>().createTask(Task(
                  title: titleController.text,
                  description: descController.text,
                  isCompleted: false,
                  createdAt: DateTime.now()));
              Navigator.of(context).pop();
            },
            child: const Text('Create'))
      ],
    );
  }
}
