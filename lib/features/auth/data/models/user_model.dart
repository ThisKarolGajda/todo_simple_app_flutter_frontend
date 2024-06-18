import 'package:todo_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(super.email, super.todos);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'todos': todos
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(json['email'], json['todos'],);
  }

  UserModel copyWith({String? newEmail, List<String>? newTodos}) {
    return UserModel(newEmail ?? email, newTodos ?? todos,);
  }
}