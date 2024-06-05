// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTask(TaskModel task) async {
    await _db.collection('tasks').doc(task.id).set(task.toFireBase());
  }

  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }

  Future<void> updateTask(TaskModel task) async {
    await _db.collection('tasks').doc(task.id).update(task.toFireBase());
  }

  Future<void> updateTaskStatus(String id, bool status) async {
    await _db.collection('tasks').doc(id).update({'status': status});
  }

  Stream<List<TaskModel>> getTasks({TaskFilter? filter}) {
    return _db.collection('tasks').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => TaskModel.fromFireBase(doc.data(), doc.id))
        .toList());
  }
}
