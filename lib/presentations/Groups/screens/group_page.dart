import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/presentations/Groups/screens/group_details_screen.dart'; // Ensure this path is correct
import 'package:tcdesign/presentations/home/widgets/sort_dropdown.dart';
import '../controller/group_controller.dart';
import '../widgets/group_card.dart';

class GroupsPage extends StatelessWidget {
  final GroupsController controller = Get.put(GroupsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 4.h),
            Text(
              'My Groups',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Obx(() => SortDropdown(
              value: controller.selectedSort.value,
              options: controller.sortOptions,
              onChanged: controller.onSortChanged,
            )),
            SizedBox(height: 2.h),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.h,
                  ),
                  itemCount: controller.groups.length,
                  itemBuilder: (context, index) {
                    final group = controller.groups[index];
                    return GroupCard(
                      groupName: group.name,
                      membersCount: group.members,
                      onTap: () {
                        // Navigate to the GroupDetailsPage, passing the selected group details
                        Get.to(() => GroupDetailsPage(group: group));
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
