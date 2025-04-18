class Task {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;

  Task(
      {this.id,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.createdAt});

  Task copyWith(
      {int? id,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? createdAt}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        createdAt: createdAt ?? this.createdAt);
  }
}
