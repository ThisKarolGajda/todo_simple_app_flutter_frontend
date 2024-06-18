part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodosEvent extends TodoEvent {

}

class AddTodoEvent extends TodoEvent {
  final TodoModel todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo,];
}

class RemoveTodoEvent extends TodoEvent {
  final TodoModel todo;

  const RemoveTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo,];
}