import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/tasks/presentation/provider/tasks_provider.dart';
import 'package:todo_app/features/tasks/presentation/widgets/create_task_dialog.dart';
import 'package:todo_app/features/tasks/presentation/widgets/task_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const CreateTaskDialog();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<TasksProvider>(builder: (context, provider, widget) {
        if (provider.status == TasksStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (provider.status == TasksStatus.error) {
          return Center(child: Text(provider.errorMessage));
        }
        if (provider.status == TasksStatus.success) {
          return ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              return TaskItemWidget(task: provider.tasks[index]);
            },
          );
        }
        return const Center();
      }),
    );
  }
}
