import 'package:either_dart/src/either.dart';
import 'package:todo_app/features/auth/data/data_sources/auth_service.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';
import 'package:todo_app/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final AuthService _authService;

  UserRepositoryImpl(
    this._authService,
  );

  @override
  Future<Either<Exception, List<UserEntity>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UserEntity>> logIn(
      String email, String password) async {
    return _authService.getUser(email, password);
  }

  @override
  Future<void> logOut() async {
    // TODO: implement logOut
  }
}
