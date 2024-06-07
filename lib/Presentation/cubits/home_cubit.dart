import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ropulva_task_app_assesment/Data/network/fire_store_services.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FirestoreService firestoreService;

  HomeCubit({required this.firestoreService}) : super(TaskInitial()) {
    getTasks(TaskFilter.done);
  }

  // ****************************************************************
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

// ****************************************************************
  void addTask(TaskModel task) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.addTask(task);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

// ****************************************************************
  void deleteTask(String id) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.deleteTask(id);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  //  ****************************************************************

  void updateTaskStatus(String id, bool status) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.updateTaskStatus(id, status);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

//    ****************************************************************
  void updateTask(TaskModel task) async {
    try {
      emit(LoadingState(message: 'Loading...'));
      await firestoreService.updateTask(task);
      // getTasks();
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

//    ****************************************************************
  void filterTasks(TaskFilter filter) async {
    final tasksStream =
        await firestoreService.getTasks().expand((tasks) => tasks).toList();
    List<TaskModel> tasks = [];
    tasks.addAll(tasksStream);

    List<TaskModel> filteredTasks;
    if (filter == TaskFilter.all) {
      filteredTasks = tasks;
      emit(FilterChipState(
          allSelected: true, notDoneSelected: false, doneSelected: false));
    } else if (filter == TaskFilter.notDone) {
      filteredTasks = tasks.where((task) => !task.status).toList();
      emit(FilterChipState(
          allSelected: false, notDoneSelected: true, doneSelected: false));
    } else {
      filteredTasks = tasks.where((task) => task.status).toList();
      emit(FilterChipState(
          allSelected: false, notDoneSelected: false, doneSelected: true));
    }
    emit(SuccessState(
      tasks: filteredTasks,
      filter: filter,
    ));
  }
}

enum TaskFilter { all, notDone, done }
