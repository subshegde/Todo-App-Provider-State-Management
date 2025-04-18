import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';

class DeleteTaskUseCase{
  final TaskRepository taskRepository;

  DeleteTaskUseCase({required this.taskRepository});

  Future<Either<Failure,void>> call(int id) async{
    return await taskRepository.deleteTask(id);
  }
}