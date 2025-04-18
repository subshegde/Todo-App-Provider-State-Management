import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';

class UpdateTaskUseCase{
  final TaskRepository repository;

  UpdateTaskUseCase({required this.repository});

  Future<Either<Failure,void>> call(Task task) async{
    return await repository.updateTask(task);
  }
}