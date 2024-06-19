import 'package:either_dart/either.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Exception, List<UserEntity>>> getAllUsers();

  Future<Either<Exception, UserEntity>> logIn(String email, String password);

  Future<void> logOut();
}
