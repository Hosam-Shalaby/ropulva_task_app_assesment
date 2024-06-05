import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ropulva_task_app_assesment/Data/network/fire_store_services.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final FirestoreService firestoreService;

  HomeCubit({required this.firestoreService}) : super(TaskInitial()) {
    getTasks(TaskFilter.done);
  }
  List<TaskModel> tasks = [];
  void getTasks(TaskFilter filter) {
    emit(LoadingState(message: 'Loading...'));
    firestoreService.getTasks().listen(
      (tasks) {
        emit(SuccessState(tasks: tasks, filter: filter));
      },
      onError: (error) {
        emit(ErrorState(errorMessage: error.toString()));
      },
    );
  }

  void addTask(TaskModel task) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.addTask(task);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  void deleteTask(String id) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.deleteTask(id);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  void updateTaskStatus(String id, bool status) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.updateTaskStatus(id, status);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  void updateTask(TaskModel task) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.updateTask(task);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  void filterTasks(TaskFilter filter) async {
    final tasksStream = await firestoreService
        .getTasks()
        .expand((tasks) => tasks)
        .toList(); // استخدام expand() لتحويل القوائم إلى تيار واحد من العناصر
    List<TaskModel> tasks = [];
    tasks.addAll(tasksStream); // الآن يمكننا استخدام addAll() بشكل صحيح

    List<TaskModel> filteredTasks;
    if (filter == TaskFilter.all) {
      filteredTasks = tasks;
      emit(FilterChipState(
          allSelected: true,
          notDoneSelected: false,
          doneSelected: false)); // تحديث الحالة
    } else if (filter == TaskFilter.notDone) {
      filteredTasks = tasks.where((task) => !task.status).toList();
      emit(FilterChipState(
          allSelected: false,
          notDoneSelected: true,
          doneSelected: false)); // تحديث الحالة
    } else {
      filteredTasks = tasks.where((task) => task.status).toList();
      emit(FilterChipState(
          allSelected: false,
          notDoneSelected: false,
          doneSelected: true)); // تحديث الحالة
    }
    emit(SuccessState(
      tasks: filteredTasks,
      filter: filter,
    )); // تحديث حالة الـ SuccessState بعد عملية التصفية
  }
}

enum TaskFilter { all, notDone, done }

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
