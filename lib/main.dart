import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ropulva_task_app_assesment/Presentation/cubits/home_cubit.dart';
import 'package:ropulva_task_app_assesment/Presentation/views/Android/Home%20View/home_view.dart';
import 'package:ropulva_task_app_assesment/Data/network/fire_store_services.dart';
import 'package:ropulva_task_app_assesment/Presentation/views/Desktop/Home%20View/home_view.dart';
import 'package:ropulva_task_app_assesment/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) =>
                HomeCubit(firestoreService: FirestoreService()),
          ),
        ],
        child: ScreenUtilInit(
            designSize: Platform.isWindows
                ? const Size(800, 600)
                : const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'First Method',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  textTheme:
                      Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
                ),
                home: child,
              );
            },
            child: Platform.isWindows
                ? const HomeScreenDesktop()
                : const HomeScreenAndroid()));
  }
}
