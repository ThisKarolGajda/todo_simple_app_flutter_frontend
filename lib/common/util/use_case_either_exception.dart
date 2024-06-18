import 'package:either_dart/either.dart';

abstract class UseCaseEitherException<Type, Param> {
  Future<Either<Exception, Type>> call(Param param);
}
