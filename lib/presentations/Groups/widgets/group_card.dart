import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GroupCard extends StatelessWidget {
  final String groupName;
  final int membersCount;
  final VoidCallback onTap;

  const GroupCard({
    required this.groupName,
    required this.membersCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Color(0xFFE2E2FF), // Lighter blue
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              groupName,
              style: TextStyle(
                color: Colors.black, // Group name color
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/groupicon.png',
                  width: 10.w, // Set width as per your requirement
                  height: 10.w, // Set height as per your requirement
                ),
                SizedBox(width: 3.w),
                Text(
                  '$membersCount',
                  style: TextStyle(
                    color: Color(0xFF5A099B),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
