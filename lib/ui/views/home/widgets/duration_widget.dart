import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';
import 'package:job_task/gen/assets.gen.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _buildProgressIndicator(),
              ],
            ),
            Gap(20.w),
            _buildColumn(),
          ],
        ),
      ],
    );
  }

  Widget _buildColumn() {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "মেয়াদকাল",
            style: AppTextStyle.blackS16B700,
          ),
          Gap(4.w),
          Row(
            children: [
              SvgPicture.asset(Assets.svg.calender),
              const Text(
                "১২ জানুয়ারী ২০২৩ - ৩১ জানুয়ারী ২০২৪",
                style: AppTextStyle.blackS12B600,
              ),
            ],
          ),
          Gap(12.h),
          Text(
            "আরও বাকি",
            style: AppTextStyle.blackS16B700.copyWith(color: AppColors.red),
          ),
          Gap(4.h),
          Row(
            children: [
              _buildTimeBox("05", "দিন"),
              Gap(20.w),
              _buildTimeBox("06", "মাস"),
              Gap(20.w),
              _buildTimeBox("12", "বছর"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 108.w,
              height: 108.h,
              child: const RotationTransition(
                turns: AlwaysStoppedAnimation(0.5),
                child: CircularProgressIndicator(
                  value: 0.1,
                  strokeWidth: 10,
                  backgroundColor: AppColors.accent,
                ),
              ),
            ),
            const Text(
              "6 মাস 6 দিন",
              style: AppTextStyle.blackS14B600,
            ),
          ],
        ),
        Gap(8.h),
        const Text(
          'সময় অতিবাহিত',
          style: AppTextStyle.blackS16B700,
        )
      ],
    );
  }

  Widget _buildTimeBox(String value, String label) {
    List<int> numbers = value.split('').map((e) => int.parse(e)).toList();
    return Column(
      children: [
        Row(
          children: [
            _buildBox(number: numbers.first),
            Gap(5.w),
            _buildBox(number: numbers.last),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style:
              AppTextStyle.blackS12B600.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildBox({required int number}) {
    return Container(
      width: 24.h,
      height: 24.w,
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: AppColors.accent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: AppColors.red,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Center(
        child: Text(
          number.toString(),
          textAlign: TextAlign.center,
          style: AppTextStyle.blackS12B600,
        ),
      ),
    );
  }
}
