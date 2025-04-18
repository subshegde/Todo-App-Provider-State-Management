import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends Task {
  TaskModel(
      {super.id,
      required super.title,
      required super.description,
      required super.isCompleted,
      required super.createdAt});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isCompleted": isCompleted ? 1 : 0,
      "createdAt": createdAt.toIso8601String()
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'] == 1,
        createdAt: DateTime.parse(json['createdAt']));
  }

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
        id: task.id,
        title: task.title,
        description: task.description,
        isCompleted: task.isCompleted,
        createdAt: task.createdAt);
  }
}
