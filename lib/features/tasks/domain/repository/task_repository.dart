import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

abstract class TaskRepository{
  Future<Either<Failure,List<Task>>> getTasks();
  Future<Either<Failure,Task>> getTaskById(int id);
  Future<Either<Failure,void>> createTask(Task task);
  Future<Either<Failure,void>> updateTask(Task task);
  Future<Either<Failure,void>> deleteTask(int id);
}