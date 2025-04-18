import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/tasks/data/model/task_model.dart';

class LocalTaskDatasource{
  final Database database;

  LocalTaskDatasource({required this.database});

  Future<List<TaskModel>> getTasks() async{
    var results = await database.query('tasks');
    return results.map((e)=> TaskModel.fromJson(e)).toList();
  }

  Future createTask(TaskModel taskModel) async{
    await database.insert('tasks', taskModel.toJson());
  }

  Future updateTasks(TaskModel taskModel) async{
    await database.update('tasks', taskModel.toJson(),where: 'id = ?',whereArgs: [taskModel.id]);
  }

  Future deleteTask(int id) async{
    await database.delete('tasks',where: 'id = ?',whereArgs: [id]);
  }

  Future<TaskModel> getTaskById(int id) async{
    var results =  await database.query('tasks',where: 'id = ?',whereArgs: [id]);
    return TaskModel.fromJson(results.first);
  }
}