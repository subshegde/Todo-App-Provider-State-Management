import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/di/get_it.dart';
import 'package:todo_app/features/tasks/presentation/provider/single_task_provider.dart';

class TaskDetails extends StatelessWidget {
  final int id;
  const TaskDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> getIt<SingleTaskProvider>()..getTaskById(id),
      child: Scaffold(
        body: Consumer<SingleTaskProvider>(builder: (context, provider, widget) {
          if (provider.status == SingleTaskStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (provider.status == SingleTaskStatus.error) {
            return Center(
              child: Text(provider.errorMessage),
            );
          }
          if (provider.status == SingleTaskStatus.success) {
            return Column(
              children: [
                Text(provider.task!.title),
                Text(provider.task!.description),
                Text(provider.task!.createdAt.toIso8601String()),
              ],
            );
          }
          return const Center();
        }),
      ),
    );
  }
}
