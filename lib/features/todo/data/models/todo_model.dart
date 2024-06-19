import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel(super.title, super.description, super.completed);

  static TodoModel fromJson(Map<String, dynamic> json) {
    return TodoModel(
      json['title'],
      json['description'],
      json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  TodoModel copyWith({String? title, String? description, bool? completed}) {
    return TodoModel(
      title ?? this.title,
      description ?? this.description,
      completed ?? this.completed,
    );
  }
}
