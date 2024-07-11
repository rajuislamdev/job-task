import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';
import 'package:job_task/models/grid_item_model.dart';

class GridCard extends StatelessWidget {
  final GridItemModel gridItemModel;
  const GridCard({super.key, required this.gridItemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 72.h,
            width: 72.w,
            padding: EdgeInsets.all(20.r),
            decoration: ShapeDecoration(
              color: AppColors.accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.20),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(gridItemModel.image),
            ),
          ),
          Gap(8.h),
          Text(
            'মেনু নং ',
            textAlign: TextAlign.center,
            style: AppTextStyle.blackS16B700.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            gridItemModel.title,
            textAlign: TextAlign.center,
            style: AppTextStyle.blackS16B700.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
