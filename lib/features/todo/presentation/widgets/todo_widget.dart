import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/common/injection/dependency_injection.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        TodoModel todoModel = todo.copyWith(completed: !todo.completed);
        sl<TodoBloc>().add(AddTodoEvent(todoModel));
      },
      child: Container(
        margin: EdgeInsets.only(left: 2.5.w, right: 2.5.w, top: 1.h, bottom: 1.h,),
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffa8a4a4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ), maxLines: 1,),
                Text(todo.description, style: TextStyle(
                  fontSize: 17.sp,
                ),),
              ],
            ),
            Icon(todo.completed ? Icons.add : Icons.close, size: 28.sp, color: todo.completed ? Colors.green : Colors.red,),

          ],
        ),
      ),
    );
  }
}
