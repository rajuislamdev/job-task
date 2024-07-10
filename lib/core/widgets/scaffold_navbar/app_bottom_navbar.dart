import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:job_task/core/routes/routes.dart';
import 'package:job_task/core/styles/app_color.dart';
import 'package:job_task/core/widgets/scaffold_navbar/bottom_appbar_cliper.dart';
import 'package:job_task/core/widgets/scaffold_navbar/bottom_item.dart';
import 'package:job_task/core/widgets/scaffold_navbar/scaffold_navbar_controller.dart';

class AppBottomNavbar extends StatelessWidget {
  AppBottomNavbar({super.key});

  final ScaffoldNavbarController _controller =
      Get.put(ScaffoldNavbarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 50,
            offset: Offset(2, -4),
            spreadRadius: 0,
          )
        ],
      ),
      child: ClipPath(
        clipper: BottomAppBarClipper(),
        child: BottomAppBar(
          color: AppColors.secondary,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(),
          ),
          notchMargin: 8.0,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _bottomItems.length,
              (index) => _buildBottomItemWidget(
                icon: _bottomItems[index].icon,
                index: index,
                isActive: index == _controller.currentIndex.value,
                onPressed: () => _controller.goOtherTab(
                  index,
                  (i) => GoRouter.of(context).go(_bottomItems[index].location),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomItemWidget({
    required IconData icon,
    required int index,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        right: index == 1 ? 20 : 0,
        left: index == 2 ? 20 : 0,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Visibility(
              visible: isActive,
              child: const CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  final List<BottomItem> _bottomItems = const [
    BottomItem(
      icon: Icons.home,
      location: Routes.home,
    ),
    BottomItem(
      icon: Icons.calendar_today,
      location: Routes.activity,
    ),
    BottomItem(
      icon: Icons.list,
      location: Routes.other,
    ),
    BottomItem(
      icon: Icons.person,
      location: Routes.profile,
    ),
  ];
}
