import 'package:flutter/material.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';

sealed class HomeState {}

class TaskInitial extends HomeState {}

class LoadingState extends HomeState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends HomeState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}

class SuccessState extends HomeState {
  final List<TaskModel> tasks;
  final TaskFilter filter;

  SuccessState({required this.tasks, required this.filter});
}

class FilterChipState extends HomeState {
  final bool allSelected;
  final bool notDoneSelected;
  final bool doneSelected;

  FilterChipState({
    required this.allSelected,
    required this.notDoneSelected,
    required this.doneSelected,
  });
}

void showAddTasksSheet(BuildContext context, Widget widgetScreen) {
  showModalBottomSheet(context: context, builder: (context) => widgetScreen
      // AddTaskScreen(),
      );
}

void showEditTasksSheet(
    BuildContext context, TaskModel task, Widget widgetScreen) {
  showModalBottomSheet(context: context, builder: (context) => widgetScreen
      // EditTaskScreen(task: task),
      );
}
