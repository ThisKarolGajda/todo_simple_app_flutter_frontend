import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/common/injection/dependency_injection.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  get _buildAppBar => AppBar(
    backgroundColor: const Color(0xff2b42cb),
    title: const Text('TodoApp', style: TextStyle(
      color: Colors.white,
    ),),
    centerTitle: true,
  );

  get _buildBody =>
      BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            return SafeArea(child: SingleChildScrollView(
              child: ListView.builder(itemCount: state.todos.length, itemBuilder: (context, index) {
                TodoModel todo = state.todos[index];
                return TodoWidget(todo: todo);
              }, shrinkWrap: true,),),);
          }

          if (state is TodoError) {
            return Text('Error: ${state.exception}');
          }

          if (state is TodoLoading) {
            return const CircularProgressIndicator();
          }

          sl<TodoBloc>().add(LoadTodosEvent());
          return Container();
        }
      );

  get _buildFloatingActionBar => FloatingActionButton(onPressed: () {
    sl<TodoBloc>().add(AddTodoEvent(TodoModel('TITLE', 'DESCRIPTION', false)));
  },);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      appBar: _buildAppBar,
      floatingActionButton: _buildFloatingActionBar,
    );
  }
}

