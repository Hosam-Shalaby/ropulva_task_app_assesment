import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Data/model/task_model.dart';
import 'package:ropulva_task_app_assesment/utils/constant/colors.dart';

class EditTaskScreenDesktop extends StatelessWidget {
  final TaskModel task;
  final TextEditingController taskController;
  final TextEditingController dateController;

  EditTaskScreenDesktop({super.key, required this.task})
      : taskController = TextEditingController(text: task.title),
        dateController = TextEditingController(
            text: task.dueDate.toLocal().toString().split(' ')[0]);

  @override
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text('Edit Task'),
        //   leading: IconButton(
        //     icon: const Icon(Icons.close, color: Colors.red),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        // ),
        SizedBox(
      height: 320.h,
      width: 420.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              textAlign: TextAlign.center,
              'Edit Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              style: const TextStyle(fontSize: 22, color: Colors.black),

              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Task title',
                border: OutlineInputBorder(

                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                // تغيير لون النص للون أزرق
              ),
              // تغيير لون النص للون أزرق
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              style: const TextStyle(fontSize: 22, color: Colors.black),
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Due Date',
                border: OutlineInputBorder(
                    // borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
              ),
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
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final updatedTask = TaskModel(
                  id: task.id,
                  title: taskController.text,
                  dueDate: DateTime.parse(dateController.text),
                  status: task.status,
                );
                context.read<HomeCubit>().updateTask(updatedTask);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstantColors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Save Task',
                style: TextStyle(color: ConstantColors.filledWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
