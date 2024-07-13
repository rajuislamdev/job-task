// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';

class ActivityCardWidget extends StatelessWidget {
  final int index;
  const ActivityCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Column(
            children: [
              Text(
                'সকাল ',
                style: AppTextStyle.blackS14B600.copyWith(
                    fontWeight: FontWeight.w500,
                    color: index.isOdd ? Colors.blue : null),
              ),
              Text(
                '২:৩০ মি.',
                style: AppTextStyle.blackS14B600.copyWith(
                    fontWeight: FontWeight.w500,
                    color: index.isOdd ? Colors.blue : null),
              ),
            ],
          ),
        ),
        Gap(12.w),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            height: 165.h,
            decoration: _decoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.more_time_sharp,
                      color: AppColors.secondary,
                    ),
                    Gap(6.w),
                    Text(
                      '১১:০০ মি.',
                      style: AppTextStyle.blackS12B600.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                Text(
                  text,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.blackS14B600.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                Gap(8.h),
                Text(
                  'বাক্য',
                  style: AppTextStyle.blackS12B600.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
                Gap(6.h),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: 14.sp,
                      color: AppColors.secondary,
                    ),
                    Gap(4.w),
                    Text(
                      'চট্টগ্রাম, বাংলাদেশ',
                      style: AppTextStyle.blackS12B600.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  ShapeDecoration _decoration() {
    return ShapeDecoration(
      gradient: index.isOdd
          ? null
          : const LinearGradient(
              begin: Alignment(-0.85, -0.53),
              end: Alignment(0.85, -0.1),
              colors: [
                Color(0xFF86B560),
                Color(0xFF336F4A),
              ],
            ),
      color: index.isOdd ? AppColors.black : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.72),
      ),
    );
  }

  final String text =
      "সেথায় তোমার কিশোরী বধূটি মাটির প্রদীপ ধরি, তুলসীর মূলে প্রণাম যে আঁকে হয়ত তোমারে স্মরি।";
}
