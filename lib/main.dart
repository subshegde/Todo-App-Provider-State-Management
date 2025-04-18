import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/di/get_it.dart';
import 'package:todo_app/features/tasks/presentation/pages/home_page.dart';
import 'package:todo_app/features/tasks/presentation/provider/tasks_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<TasksProvider>()..getTasks(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
