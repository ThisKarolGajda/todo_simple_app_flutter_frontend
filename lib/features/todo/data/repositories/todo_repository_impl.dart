import 'package:either_dart/src/either.dart';
import 'package:todo_app/features/todo/data/data_sources/todo_api_service.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoApiService _service;

  TodoRepositoryImpl(this._service);

  @override
  Future<Either<Exception, bool>> addTodo(TodoEntity todo) {
    return _service.addTodo(todo as TodoModel);
  }

  @override
  Future<Either<Exception, List<TodoEntity>>> getTodos() {
    return _service.getTodos();
  }

  @override
  Future<Either<Exception, bool>> removeTodo(TodoEntity todo) {
    return _service.deleteTodo(todo as TodoModel);
  }

}