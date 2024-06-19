part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final UserEntity currentUser;

  const AuthLoaded(this.currentUser);

  @override
  List<Object> get props => [
        currentUser,
      ];
}

final class AuthError extends AuthState {
  final Exception exception;

  const AuthError(this.exception);

  @override
  List<Object> get props => [
        exception,
      ];
}
