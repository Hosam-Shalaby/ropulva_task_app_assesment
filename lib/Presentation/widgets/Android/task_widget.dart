import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_state.dart';
import 'package:ropulva_task_app_assesment/Presentation/views/Android/Edit%20Task%20view/edit_task.dart';
import 'package:ropulva_task_app_assesment/utils/constant/colors.dart';

class TaskWidgetAndroid extends StatelessWidget {
  TaskWidgetAndroid({super.key, required this.task});
  TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Due Date: ${DateFormat('E yyyy-MM-dd ').format(task.dueDate)}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                task.status ? Icons.check_circle : Icons.check_circle_outline,
                color: ConstantColors.green,
              ),
              onPressed: () {
                context
                    .read<HomeCubit>()
                    .updateTaskStatus(task.id, !task.status);
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showEditTasksSheet(
                    context, task, EditTaskScreenAndroid(task: task));
              },
            ),
          ],
        ),
        onLongPress: () {
          context.read<HomeCubit>().deleteTask(task.id);
        },
      ),
    );
  }
}
