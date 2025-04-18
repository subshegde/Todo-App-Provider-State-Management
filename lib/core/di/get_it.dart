import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/database/app_database.dart';
import 'package:todo_app/features/tasks/data/repository/task_repo_impl.dart';
import 'package:todo_app/features/tasks/data/sources/local_task_datasource.dart';
import 'package:todo_app/features/tasks/domain/repository/task_repository.dart';
import 'package:todo_app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:todo_app/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/features/tasks/domain/usecases/get_task_byId.dart';
import 'package:todo_app/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:todo_app/features/tasks/presentation/provider/single_task_provider.dart';
import 'package:todo_app/features/tasks/presentation/provider/tasks_provider.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  // Order matters here!
  await registerDatabase();
  await registerDataSources();
  await registerRepositories();
  await registerUseCases();
  await registerProviders();
}

Future<void> registerDatabase() async {
  final db = await AppDatabase.database;
  getIt.registerSingleton<Database>(db);
}


Future<void> registerDataSources() async {
  getIt.registerSingleton<LocalTaskDatasource>(
    LocalTaskDatasource(database: getIt()),
  );
}

Future<void> registerRepositories() async {
  getIt.registerSingleton<TaskRepository>(
    TaskRepoImpl(localTaskDatasource: getIt()),
  );
}

Future<void> registerUseCases() async {
  getIt.registerSingleton<GetTasksUseCase>(
    GetTasksUseCase(taskRepository: getIt()),
  );
  getIt.registerSingleton<GetTaskByIdUseCase>(
    GetTaskByIdUseCase(taskRepository: getIt()),
  );
  getIt.registerSingleton<UpdateTaskUseCase>(
    UpdateTaskUseCase(repository: getIt()),
  );
  getIt.registerSingleton<CreateTaskUseCase>(
    CreateTaskUseCase(taskRepository: getIt()),
  );
  getIt.registerSingleton<DeleteTaskUseCase>(
    DeleteTaskUseCase(taskRepository: getIt()),
  );
}

Future<void> registerProviders() async {
  getIt.registerSingleton<TasksProvider>(
    TasksProvider(
      getTasksUseCase: getIt(),
      createTaskUseCase: getIt(),
      updateTaskUseCase: getIt(),
      deleteTaskUseCase: getIt(),
    ),
  );

  getIt.registerSingleton<SingleTaskProvider>(
    SingleTaskProvider(getTaskByIdUseCase: getIt()),
  );
}
