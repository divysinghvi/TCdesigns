import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/constants/colors/constants.dart';

import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 4.h), // Adds some spacing below the title
              Text(
                "Summary History 📜",
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 2.h), // Adds some spacing below the title
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w), // Add horizontal padding
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5A099B), // Starting color
                        Color(0xFF1F0335), // Ending color
                      ],
                      stops: [0.38, 1.0], // 38% and 100% stops
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                    ,
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  child: Obx(() {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.historyList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.2.h, horizontal: 3.w),
                              tileColor: Colors.transparent,
                              title: Text(
                                "${controller.historyList[index].month}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                // Navigate to the detail page for the corresponding history item
                                controller.navigateToDetailPage(index);
                              },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${controller.historyList[index].pointsEarned} points",  // Fix: points -> pointsEarned
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  SizedBox(width: 2.w), // Add spacing between text and icon
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18.sp,
                                  ),
                                ],
                              ),

                            ),
                            if (index < controller.historyList.length - 1)
                              Divider(color: Colors.white24), // Add divider between items
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
