import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';

class GetTasksUseCase{
  final TaskRepository taskRepository;

  GetTasksUseCase({required this.taskRepository});

  Future<Either<Failure,List<Task>>> call() async{
    return await taskRepository.getTasks();
  }
}