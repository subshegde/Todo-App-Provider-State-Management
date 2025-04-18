import 'package:todo_app/core/model/either.dart';
import 'package:todo_app/core/model/failure.dart';
import 'package:todo_app/features/tasks/data/model/task_model.dart';
import 'package:todo_app/features/tasks/data/sources/local_task_datasource.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';

class TaskRepoImpl implements TaskRepository{
  final LocalTaskDatasource localTaskDatasource;

  TaskRepoImpl({required this.localTaskDatasource});
  @override
  Future<Either<Failure, void>> createTask(Task task) async{
    try{
      await localTaskDatasource.createTask(TaskModel.fromEntity(task));
      return Right(value: null);
    }catch(e){
      return Left(value: DatabaseFailure(errorMessage: 'Create task failure'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async{
    try{
      await localTaskDatasource.deleteTask(id);
      return Right(value: null);
    }catch(e){
      return Left(value: DatabaseFailure(errorMessage: 'Delete task failure'));
    }
  }

  @override
  Future<Either<Failure, Task>> getTaskById(int id) async{
    try{
      return Right(value: await localTaskDatasource.getTaskById(id));
    }catch(e){
      return Left(value: DatabaseFailure(errorMessage: 'Get task failure'));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks() async{
    try{
      return Right(value: await localTaskDatasource.getTasks());
    }catch(e){
      return Left(value: DatabaseFailure(errorMessage: 'Get tasks failure'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(Task task) async{
    try{
      await localTaskDatasource.updateTasks(TaskModel.fromEntity(task));
      return Right(value: null);
    }catch(e){
      return Left(value: DatabaseFailure(errorMessage: 'Get tasks failure'));
    }
  }

}