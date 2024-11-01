import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/presentations/profile/controllers/profilecontroller.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            5.w, 10.h, 5.w, 2.h), // Responsive padding using Sizer
        child: Obx(() {
          var profile = controller.profile.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture & Username
              const CircleAvatar(
                radius: 40, // Fixed radius, you could also use Sizer if needed
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              SizedBox(height: 2.h), // Responsive spacing
              Text(
                profile.username ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Joined ${profile.joinedDate}',
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
              SizedBox(height: 2.h),
              // Friends & Points
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${profile.friendsCount} friends',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                  Text(
                    '✨ ${profile.points} ✨ points',
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              // Status message
              Text(
                profile.statusMessage ?? '',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              SizedBox(height: 3.h),
              // Add Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(10, 149, 16, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.white, // White border
                      width: 1, // Border width
                    ),
                  ),
                  minimumSize: Size(30.w,
                      6.h), // Width and height using Sizer for responsiveness
                  padding: EdgeInsets.symmetric(
                      vertical: 1.h), // Additional vertical padding
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 10.sp, color: Colors.white), // Larger font size
                ),
              ),

              SizedBox(height: 2.h),
              // Recent Awards Section
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Round corners
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5A099B), // Starting color
                        Color(0xFF1F0335), // Ending color
                      ],
                      stops: [0.38, 1.0], // 38% and 100% stops
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ) // Different color for visibility if needed
                    ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center text alignment
                  children: [
                    SizedBox(height: 1.h),
                    Center(
                      child: Text(
                        'Most Recent Awards',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          // Add underline
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),

                    // Use a fixed height or shrinkWrap
                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15), // Round corners
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF5A099B), // Starting color
                              Color(0xFF1F0335), // Ending color
                            ],
                            stops: [0.38, 1.0], // 38% and 100% stops
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ), // Different color for visibility if needed
                        ),
                        child: SizedBox(
                          height: 34.h,
                          child: Padding(
                            padding: EdgeInsets.all(
                                4.w), // Padding inside the container
                            child: Column(
                              children: [
                                for (var award in profile.awards ?? [])
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            award?.title ?? '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          Text(
                                            award?.category ?? '',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 178, 175, 175),
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Color.fromARGB(255, 178, 175,
                                            175), // White divider line
                                        thickness: 1, // Divider thickness
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
