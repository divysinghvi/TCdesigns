import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:get/get.dart';
import '../controller/home_body_controller.dart';
import '../widgets/category_list.dart';
import '../widgets/discover_groups_button.dart';
import '../widgets/profile_header.dart';

class HomeBody extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            ProfileHeader(),
            SizedBox(height: 4.h),
            Text(
              'Recommendations',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),

            // FutureBuilder for fetching categoriesF
            Expanded(
              child: FutureBuilder(
                future: controller.fetchCategories(), // Fetch categories
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading spinner while data is loading
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Handle error case
                    return Center(child: Text('Error loading data'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // If there's no data available
                    return Center(child: Text('No categories available'));
                  } else {
                    // When data is available, show categories
                    final categories = snapshot.data!;
                    return Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF5A099B), // Color at 77% stop
                                Color(0xFF1F0335), // Color at 100% stop
                              ],
                              stops: [0.77, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          padding: EdgeInsets.all(2.w),
                          child: Column(
                            children: categories.map<Widget>((category) {
                              return CategoryList(
                                category: category['name'],
                                items: (category['items'] as List)
                                    .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
                                    .toList(),  // Pass song data
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 4.h),
            DiscoverGroupsButton(),
          ],
        ),
      ),
    );
  }
}
