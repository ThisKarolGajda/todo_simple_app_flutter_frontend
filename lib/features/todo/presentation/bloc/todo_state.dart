part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {

}

final class TodoLoading extends TodoState {

}

final class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  const TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos,];
}

final class TodoError extends TodoState {
  final Exception exception;

  const TodoError(this.exception);

  @override
  List<Object> get props => [exception,];
}
