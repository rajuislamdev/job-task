// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';
import 'package:job_task/ui/views/activity/activity_view_model.dart';

class FilterCard extends StatelessWidget {
  final DateTime dateTime;
  FilterCard({
    super.key,
    required this.dateTime,
  });

  final ActivityViewModel _activityViewModel = Get.find<ActivityViewModel>();
  final DateFormat dateFormatter = DateFormat('MMMM d, yyyy');
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _activityViewModel.setSelectedDay(
            dateFormatter.format(dateTime),
          );
          _activityViewModel.fetchActivities();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: _activityViewModel.selectedDay ==
                        dateFormatter.format(dateTime)
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.E('bn_BD').format(dateTime),
                style: AppTextStyle.grayS14B400,
              ),
              Gap(4.h),
              Text(
                DateFormat.d('bn_BD').format(dateTime),
                style: AppTextStyle.blackS16B700.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
