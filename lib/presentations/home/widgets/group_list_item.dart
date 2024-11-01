import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/presentations/Groups/controller/group_controller.dart';
import 'package:tcdesign/presentations/home/screens/mockgroupdetails.dart';
import 'package:get/get.dart';


class GroupListItem extends StatelessWidget {
  final String title;
  final int membersCount;
  final GroupsController groupsController = Get.find<GroupsController>();


  GroupListItem({required this.title, required this.membersCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          // Navigate to GroupDetailsPage using GetX
          groupsController.detailsBasketball();
        },

        child: Container(
          margin: EdgeInsets.symmetric(vertical: 1.h),
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(50), // Rounded corners
            border: Border.all( // Adding a thin white border
              color: Colors.white,
              width: 1, // Border thickness
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
                textAlign: TextAlign.center, // Center text horizontally
              ),
              SizedBox(height: 1.h), // Add space between the title and the icon row
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                children: [
                  Icon(Icons.group, color: Colors.white, size: 10.sp),
                  SizedBox(width: 1.w),
                  Text(
                    membersCount.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
