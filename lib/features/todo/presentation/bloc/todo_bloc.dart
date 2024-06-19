import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(TodoInitial()) {
    on<LoadTodosEvent>(onLoadTodos);
    on<AddTodoEvent>(onAddTodo);
    on<RemoveTodoEvent>(onRemoveTodo);
  }

  onLoadTodos(LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    Either<Exception, List<TodoEntity>> either = await _repository.getTodos();
    if (either.isLeft) {
      emit(TodoError(either.left));
      return;
    }

    emit(TodoLoaded(either.right.map((todo) => todo as TodoModel).toList()));
  }

  onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    Either<Exception, bool> either = await _repository.addTodo(event.todo);
    if (either.isLeft) {
      emit(TodoError(either.left));
      return;
    }

    if (!either.right) {
      return;
    }

    emit(TodoLoading());
    Either<Exception, List<TodoEntity>> eitherList =
        await _repository.getTodos();
    if (eitherList.isLeft) {
      emit(TodoError(eitherList.left));
      return;
    }

    emit(
        TodoLoaded(eitherList.right.map((todo) => todo as TodoModel).toList()));
  }

  onRemoveTodo(RemoveTodoEvent event, Emitter<TodoState> emit) async {
    Either<Exception, bool> either = await _repository.removeTodo(event.todo);
    if (either.isLeft) {
      emit(TodoError(either.left));
      return;
    }

    if (!either.right) {
      return;
    }

    emit(TodoLoading());
    Either<Exception, List<TodoEntity>> eitherList =
        await _repository.getTodos();
    if (eitherList.isLeft) {
      emit(TodoError(eitherList.left));
      return;
    }

    emit(
        TodoLoaded(eitherList.right.map((todo) => todo as TodoModel).toList()));
  }
}
