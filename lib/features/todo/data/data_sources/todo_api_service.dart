import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';

class TodoApiService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://todosimpleappbackend-md3omytgiq-lm.a.run.app/";

  Future<Either<Exception, List<TodoModel>>> getTodos() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/api/todos',
      );

      if (response.data == null) {
        return const Right([]);
      }

      if (response.data is List<dynamic>) {
        List<TodoModel> todos = [];
        for (Map<String, dynamic> map in response.data) {
          todos.add(TodoModel.fromJson(map));
        }

        return Right(todos);
      }

      return Left(Exception('Invalid response type'));
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  Future<Either<Exception, bool>> addTodo(TodoModel todo) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/api/todos',
        data: todo.toJson()
      );

      if (response.statusCode == 200) {
        return const Right(true);
      }

      return Left(Exception('Invalid response code'));
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  Future<Either<Exception, bool>> deleteTodo(TodoModel todo) async {
    try {
      final response = await _dio.delete(
          '$_baseUrl/api/todos/${todo.title}',
      );

      if (response.statusCode == 200) {
        return const Right(true);
      }

      return Left(Exception('Invalid response code'));
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}