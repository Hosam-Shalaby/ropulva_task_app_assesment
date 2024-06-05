import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Presentation/views/Android/Add%20Task%20View/add_task_screen.dart';
import 'package:ropulva_task_app_assesment/Presentation/widgets/Android/filter_tasks_list.dart';
import 'package:ropulva_task_app_assesment/Presentation/widgets/Android/tab_bar_item.dart';
import 'package:ropulva_task_app_assesment/utils/constant/colors.dart';

class HomeScreenAndroid extends StatelessWidget {
  const HomeScreenAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: AppBar(
                  title: Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 35.sp),
                  ),
                  bottom: TabBar(
                    labelPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: ConstantColors.green,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    tabs: const [
                      TabBarItemAndroid(title: 'All'),
                      TabBarItemAndroid(title: 'Not Done'),
                      TabBarItemAndroid(title: 'Done'),
                      SizedBox(),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            body: const Padding(
              padding: EdgeInsets.all(15),
              child: TabBarView(
                children: [
                  FilteredTaskListAndroid(filter: TaskFilter.all),
                  FilteredTaskListAndroid(filter: TaskFilter.notDone),
                  FilteredTaskListAndroid(filter: TaskFilter.done),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showAddTasksSheet(context, AddTaskScreenAndroid());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: ConstantColors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Create Task',
                  style: TextStyle(
                    color: ConstantColors.filledWhite,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
