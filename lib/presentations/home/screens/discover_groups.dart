// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tcdesign/constants/colors/constants.dart';
// import '../controller/discover_group_controller.dart';
// import '../widgets/group_list_item.dart';
// import '../widgets/sort_dropdown.dart';
//
// class DiscoverGroupsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final DiscoverGroupsController controller = Get.put(DiscoverGroupsController());
//
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.backgroundColor,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 4.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Discover Groups 🔎',
//               style: TextStyle(color: Colors.white, fontSize: 22.sp),
//             ),
//             SizedBox(height: 3.h),
//             Obx(() => SortDropdown(
//               value: controller.selectedSort.value,
//               options: controller.sortOptions,
//               onChanged: controller.onSortChanged,
//             )),
//             SizedBox(height: 3.h),
//             Expanded(
//               child: Obx(() => ListView.builder(
//                 itemCount: controller.groups.length,
//                 itemBuilder: (context, index) {
//                   final group = controller.groups[index];
//                   return GroupListItem(
//                     title: group['title'],
//                     membersCount: group['members'],
//                   );
//                 },
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import '../controller/discover_group_controller.dart';
import '../widgets/group_list_item.dart';
import '../widgets/sort_dropdown.dart';

class DiscoverGroupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DiscoverGroupsController controller = Get.put(DiscoverGroupsController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Discover Groups 🔎',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(height: 3.h),
            Obx(() => SortDropdown(
              value: controller.selectedSort.value,
              options: controller.sortOptions,
              onChanged: controller.onSortChanged,
            )),
            SizedBox(height: 3.h),
            Expanded(
              child: Obx(() {
                // Loading state
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                // Error state
                if (controller.hasError.value) {
                  return Center(child: Text('Failed to load groups', style: TextStyle(color: Colors.red)));
                }

                // Group list
                if (controller.groups.isNotEmpty) {
                  return ListView.builder(
                    itemCount: controller.groups.length,
                    itemBuilder: (context, index) {
                      final group = controller.groups[index];
                      return GroupListItem(
                        title: group['title'],
                        membersCount: group['members'],
                      );
                    },
                  );
                }

                // No groups found
                return Center(child: Text('No groups available', style: TextStyle(color: Colors.white)));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
