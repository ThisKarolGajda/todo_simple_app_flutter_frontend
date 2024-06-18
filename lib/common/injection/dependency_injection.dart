import 'package:get_it/get_it.dart';
import 'package:todo_app/features/auth/data/data_sources/auth_service.dart';
import 'package:todo_app/features/auth/data/repositories/user_repository_impl.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_app/features/todo/data/data_sources/todo_api_service.dart';
import 'package:todo_app/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton(AuthService());
  sl.registerSingleton(UserRepositoryImpl(sl()));
  sl.registerSingleton(AuthBloc(sl<UserRepositoryImpl>()));

  sl.registerSingleton(TodoApiService());
  sl.registerSingleton(TodoRepositoryImpl(sl()));
  sl.registerSingleton(TodoBloc(sl<TodoRepositoryImpl>()));
}
