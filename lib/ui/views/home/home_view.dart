import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/styles/text_styles.dart';
import 'package:job_task/gen/assets.gen.dart';
import 'package:job_task/ui/views/home/home_view_model.dart';
import 'package:job_task/ui/views/home/widgets/duration_widget.dart';
import 'package:job_task/ui/views/home/widgets/grid_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeViewModel homeViewModel = HomeViewModel();
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
          children: [
            SvgPicture.asset(
              Assets.svg.menu,
              width: 24.w,
            ),
            Gap(16.w),
            Assets.png.demo.image(height: 37.h),
            Gap(8.w),
            const Text(
              'Flutter Task',
              style: AppTextStyle.blackS16B700,
            ),
            const Spacer(),
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
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        children: [
          _buildHeader(),
          Gap(22.h),
          _buildDurationWidget(),
          Gap(20.h),
          _buildGridView(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: ShapeDecoration(
        color: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 6,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundImage: Assets.png.person.image().image,
          ),
          Gap(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "মোঃ মোহাইমেনুল রেজা",
                style: AppTextStyle.blackS20B700,
              ),
              Gap(8.h),
              const Text(
                'সফটবিডি লিমিটেড',
                style: AppTextStyle.grayS14B400,
              ),
              Gap(4.h),
              Row(
                children: [
                  SvgPicture.asset(Assets.svg.locationPin),
                  Gap(4.w),
                  const Text(
                    'ঢাকা',
                    style: AppTextStyle.grayS14B400,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDurationWidget() {
    return const DurationWidget();
  }

  Widget _buildGridView() {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 155.h,
          crossAxisSpacing: 30.w,
          mainAxisSpacing: 8.h,
        ),
        itemCount: homeViewModel.gridItems.length,
        itemBuilder: (context, index) => GridCard(
          gridItemModel: homeViewModel.gridItems[index],
        ),
      ),
    );
  }
}
