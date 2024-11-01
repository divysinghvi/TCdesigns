import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';

import '../screens/discover_groups.dart';

class DiscoverGroupsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
          backgroundColor: AppColors.primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
            side: BorderSide(
              color: Colors.white, // White border color
              width: 1.0, // Thin border
            ),
          ),
        ),
        onPressed: () {
          Get.to(() => DiscoverGroupsPage());
        },
        child: Text(
          '✨ DISCOVER GROUPS ✨',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
