import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';

class CreateTaskUseCase{
  final TaskRepository taskRepository;

  CreateTaskUseCase({required this.taskRepository});

  Future<Either<Failure,void>> call(Task task) async{
    return await taskRepository.createTask(task);
  }
}