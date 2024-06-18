import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/common/injection/dependency_injection.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/pages/todos_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (_, __, ___) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => sl()),
            BlocProvider<TodoBloc>(create: (context) => sl()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ToDoApp',
            home: TodosPage(),
          ),
        );
      },
    );
  }
}