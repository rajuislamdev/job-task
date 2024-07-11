import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/core/routes/routes.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondary,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: false,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routerConfig: goRouter,
      ),
    );
  }
}
