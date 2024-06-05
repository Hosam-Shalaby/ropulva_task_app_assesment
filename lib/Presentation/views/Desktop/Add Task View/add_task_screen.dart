// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/utils/constant/colors.dart';

class AddTaskScreenDesktop extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  AddTaskScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: 420.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                )),
            Text(
              textAlign: TextAlign.end,
              'Create new Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: 40.h,
              child: TextField(
                style: const TextStyle(
                    color: Colors.black), 

                controller: taskController,
                decoration: InputDecoration(
                  fillColor: ConstantColors.filledWhite,
                  filled: true,
                  hintText: 'Task title',
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                ),
              ),
            ),
            SizedBox(height: 9.h),
            SizedBox(
              height: 40.h,
              child: TextField(
                style: const TextStyle(fontSize: 25, color: Colors.black),
                controller: dateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    hintText: 'Due Date',
                    hintStyle: const TextStyle(color: Colors.black26),
                    fillColor: ConstantColors.filledWhite,
                    filled: true),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dateController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final taskTitle = taskController.text;
                final taskDate = dateController.text;

                if (taskTitle.isEmpty || taskDate.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Please enter a task title and due date')),
                  );
                  return;
                }

                final newTask = TaskModel(
                  id: FirebaseFirestore.instance.collection('tasks').doc().id,
                  title: taskTitle,
                  dueDate: DateTime.parse(taskDate),
                  status: false,
                );

                context.read<HomeCubit>().addTask(newTask);

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstantColors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Save Task',
                style: TextStyle(
                  color: ConstantColors.filledWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
