import 'package:flutter/material.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/usecases/get_task_byId.dart';

enum SingleTaskStatus { initial, loading, success, error }

class SingleTaskProvider with ChangeNotifier {
  final GetTaskByIdUseCase getTaskByIdUseCase;

  SingleTaskProvider({required this.getTaskByIdUseCase});

  SingleTaskStatus status = SingleTaskStatus.initial;
  String errorMessage = '';
  Task? task;

  void setStatus(SingleTaskStatus newStatus, {String message = '', Task? task}) {
    status = newStatus;
    errorMessage = message;
    this.task = task;
    notifyListeners();
  }

  void getTaskById(int id) async {
    setStatus(SingleTaskStatus.loading);

    final result = await getTaskByIdUseCase(id);

    result.fold(
      (l) => setStatus(SingleTaskStatus.error, message: l.errorMessage),
      (r) => setStatus(SingleTaskStatus.success, task: r),
    );
  }
}
