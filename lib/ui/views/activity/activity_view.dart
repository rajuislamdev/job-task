import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';
import 'package:job_task/core/widgets/add_button.dart';
import 'package:job_task/gen/assets.gen.dart';
import 'package:job_task/ui/views/activity/activity_view_model.dart';
import 'package:job_task/ui/views/activity/widgets/activity_card.dart';
import 'package:job_task/ui/views/activity/widgets/filter_card.dart';

class ActivityView extends StatelessWidget {
  ActivityView({super.key});
  final ActivityViewModel viewModel = Get.put(ActivityViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 8.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.svg.menu,
              width: 24.w,
            ),
            const Text(
              'সময়রেখা',
              style: AppTextStyle.blackS16B700,
            ),
            CircleAvatar(
              backgroundColor: AppColors.accent,
              child: Center(
                child: Assets.png.bell.image(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          _buildRowWidget(),
          Gap(20.h),
          _buildActivityFilterWidget(),
          Gap(20.h),
          _buildTodayActicityWidget()
        ],
      ),
    );
  }

  Widget _buildRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          viewModel.getCurrentDateMonth(),
          style: AppTextStyle.blackS16B700,
        ),
        AddButton(
          buttonText: 'নতুন যোগ করুন',
          callback: () {},
        )
      ],
    );
  }

  Widget _buildActivityFilterWidget() {
    return Container(
      height: 86.h,
      decoration: ShapeDecoration(
        color: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.days.length,
            itemBuilder: (context, index) => FilterCard(
              dateTime: viewModel.days[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTodayActicityWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20.h),
        width: double.infinity,
        decoration: _decoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'আজকের কার্যক্রম',
              style: AppTextStyle.blackS16B700,
            ),
            Gap(20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: ActivityCardWidget(
                    index: index,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ShapeDecoration _decoration() {
    return ShapeDecoration(
      color: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 5,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }
}
