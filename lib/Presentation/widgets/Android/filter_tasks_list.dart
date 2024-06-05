import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Presentation/widgets/Android/task_widget.dart';

class FilteredTaskListAndroid extends StatelessWidget {
  final TaskFilter filter;

  const FilteredTaskListAndroid({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<TaskModel> filteredTasks = [];

        if (state is SuccessState) {
          if (filter == TaskFilter.all) {
            filteredTasks = state.tasks;
          } else if (filter == TaskFilter.notDone) {
            filteredTasks = state.tasks.where((task) => !task.status).toList();
          } else {
            filteredTasks = state.tasks.where((task) => task.status).toList();
          }
        }

        return ListView.builder(
          itemCount: filteredTasks.length,
          itemBuilder: (context, index) {
            final task = filteredTasks[index];
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11.0, vertical: 8.0),
                child: TaskWidgetAndroid(
                  task: task,
                ));
          },
        );
      },
    );
  }
}
