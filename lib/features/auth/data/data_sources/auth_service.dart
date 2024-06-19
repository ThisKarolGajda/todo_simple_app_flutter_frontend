import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';

class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = "localhost:8080";

  Future<Either<Exception, UserEntity>> getUser(
      String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login',
        data: {'email': email, 'password': password},
      );

      if (response.data is Map<String, dynamic>) {
        return Right(UserModel.fromJson(response.data));
      }

      return Left(Exception('Invalid response type'));
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
