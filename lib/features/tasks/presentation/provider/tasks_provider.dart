import 'package:flutter/material.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:todo_app/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/features/tasks/domain/usecases/update_task_usecase.dart';

enum TasksStatus { initial, loading, success, error }

class TasksProvider with ChangeNotifier {
  final GetTasksUseCase getTasksUseCase;
  final CreateTaskUseCase createTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;

  TasksProvider({
    required this.getTasksUseCase,
    required this.createTaskUseCase,
    required this.updateTaskUseCase,
    required this.deleteTaskUseCase,
  });

  TasksStatus status = TasksStatus.initial;
  String errorMessage = '';
  List<Task> tasks = [];

  void setStatus(TasksStatus newStatus, {String message = '', List<Task>? newTasks}) {
    status = newStatus;
    errorMessage = message;
    if (newTasks != null) {
      tasks = newTasks;
    }
    notifyListeners();
  }

  void getTasks() async {
    setStatus(TasksStatus.loading);

    final result = await getTasksUseCase();

    result.fold(
      (l) => setStatus(TasksStatus.error, message: l.errorMessage, newTasks: []),
      (r) => setStatus(TasksStatus.success, newTasks: r),
    );
  }

  void updateTask(Task task) async {
    setStatus(TasksStatus.loading);

    final result = await updateTaskUseCase(task);

    result.fold(
      (l) => setStatus(TasksStatus.error, message: l.errorMessage),
      (r) => getTasks(),
    );
  }

  void deleteTask(int id) async {
    setStatus(TasksStatus.loading);

    final result = await deleteTaskUseCase(id);

    result.fold(
      (l) => setStatus(TasksStatus.error, message: l.errorMessage),
      (r) => getTasks(),
    );
  }

  void createTask(Task task) async {
    setStatus(TasksStatus.loading);

    final result = await createTaskUseCase(task);

    result.fold(
      (l) => setStatus(TasksStatus.error, message: l.errorMessage),
      (r) => getTasks(),
    );
  }
}
