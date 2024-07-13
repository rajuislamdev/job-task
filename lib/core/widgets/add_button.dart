import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';

class AddButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback callback;
  const AddButton(
      {super.key, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: callback,
      child: Container(
        width: 100.w,
        height: 29.h,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.99, 0.43),
            end: Alignment(0.85, -0.53),
            colors: [Color(0xFF86B560), Color(0xFF336F4A)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyle.blackS12B600.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
