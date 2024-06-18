import 'package:either_dart/either.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {

  Future<Either<Exception, List<TodoEntity>>> getTodos();

  Future<Either<Exception, bool>> addTodo(TodoEntity todo);

  Future<Either<Exception, bool>> removeTodo(TodoEntity todo);
}