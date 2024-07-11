// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_task/gen/assets.gen.dart';

import 'app_bottom_navbar.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavbar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: AppBottomNavbar(),
      floatingActionButton: _buildActionButton(),

      //  FloatingActionButton(
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(100),
      //     ),
      //   ),
      //   onPressed: () => GoRouter.of(context).push(Routes.addActivity),
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.camera_alt),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildActionButton() {
    return Container(
      padding: EdgeInsets.all(10.r),
      width: 56.w,
      height: 56.h,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.85, -0.53),
          end: Alignment(-0.85, 0.53),
          colors: [
            Color(0xFF86B560),
            Color(0xFF336F4A),
          ],
        ),
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 18,
            offset: Offset(1, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: SvgPicture.asset(
        Assets.svg.camera,
      ),
    );
  }
}
