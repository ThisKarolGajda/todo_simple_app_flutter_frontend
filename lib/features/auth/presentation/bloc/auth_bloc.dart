import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';
import 'package:todo_app/features/auth/domain/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _repository;

  AuthBloc(this._repository) : super(AuthInitial()) {
    on<LogInEvent>(onLogIn);
    on<LogOutEvent>(onLogOut);
  }

  onLogIn(LogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Either<Exception, UserEntity> either = await _repository.logIn(event.email, event.password);
    if (either.isLeft) {
      emit(AuthError(either.left));
      return;
    }

    emit(AuthLoaded(either.right));
  }

  onLogOut(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _repository.logOut();
    emit(AuthInitial());
  }
}
