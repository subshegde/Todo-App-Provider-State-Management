import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';

class GetTaskByIdUseCase{
  final TaskRepository taskRepository;

  GetTaskByIdUseCase({required this.taskRepository});

  Future<Either<Failure,Task>> call(int id) async{
    return await taskRepository.getTaskById(id);
  }

}