import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Presentation/views/Desktop/Edit%20Task%20view/edit_task.dart';
import 'package:ropulva_task_app_assesment/utils/constant/colors.dart';

class TaskWidgetDesktop extends StatelessWidget {
  TaskWidgetDesktop({super.key, required this.task});
  TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
          width: 300.w,
          child: Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                task.title,
                style: const TextStyle(
                    color: ConstantColors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Due Date: ${DateFormat('E yyyy-MM-dd ').format(task.dueDate)}',
              ),
              trailing: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      task.status
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: EditTaskScreenDesktop(task: task),
                            );
                          });
                    },
                  ),
                ],
              ),
              onLongPress: () {
                context.read<HomeCubit>().deleteTask(task.id);
              },
            ),
          ),
        ),
      ],
    );
  }
}
