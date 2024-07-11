import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/core/styles/app_color.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'NotoSerifBengali',
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.secondary,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.secondary,
    titleTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
  ),
  dialogTheme: const DialogTheme(
    barrierColor: AppColors.accent,
    backgroundColor: AppColors.secondary,
  ),
);
