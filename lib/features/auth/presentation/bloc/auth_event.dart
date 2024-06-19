part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  const LogInEvent(this.email, this.password);

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

final class LogOutEvent extends AuthEvent {}
