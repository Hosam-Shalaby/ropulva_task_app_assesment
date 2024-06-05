import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Presentation/views/Desktop/Add%20Task%20View/add_task_screen.dart';
import 'package:ropulva_task_app_assesment/Presentation/widgets/Desktop/filter_tasks_list.dart';
import 'package:ropulva_task_app_assesment/Presentation/widgets/Desktop/tab_bar_item.dart';
import 'package:ropulva_task_app_assesment/utils/constant/colors.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 11, // عدد عناصر التبويب
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(140.h),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: AppBar(
                  actions: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: AddTaskScreenDesktop(),
                            );
                          },
                        );
                      },
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            color: Colors.green,
                            child: const Icon(
                              size: 40,
                              Icons.add,
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                  title: Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 21.sp),
                  ),
                  bottom: TabBar(
                    labelPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: ConstantColors.green, // تعيين لون الخلفية للمؤشر
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    // unselectedLabelColor: const Color.fromARGB(255, 18, 109, 60),
                    tabs: const [
                      TabBarItemDesktop(title: 'All'),
                      TabBarItemDesktop(title: 'Not Done'),
                      TabBarItemDesktop(title: 'Done'),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 2.0),
              child: TabBarView(
                children: [
                  FilteredTaskListDesktop(filter: TaskFilter.all),
                  FilteredTaskListDesktop(filter: TaskFilter.notDone),
                  FilteredTaskListDesktop(filter: TaskFilter.done),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
