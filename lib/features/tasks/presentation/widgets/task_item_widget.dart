import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/presentation/pages/task_details.dart';
import 'package:todo_app/features/tasks/presentation/provider/tasks_provider.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  const TaskItemWidget({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(value: task.isCompleted, onChanged: (value){
        context.read<TasksProvider>().updateTaskUseCase(task.copyWith(isCompleted: value));
      }),
      leading: IconButton(onPressed: (){
        context.read<TasksProvider>().deleteTaskUseCase(task.id!);
      }, icon: const Icon(Icons.delete)),

      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TaskDetails(id: task.id!)));},
    );
  }
}