import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcdesign/constants/colors/constants.dart';
import 'package:tcdesign/presentations/profile/controllers/profilecontroller.dart';
import 'package:sizer/sizer.dart';

class UserPage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 0.1.h, 5.w, 2.h),
        child: Obx(() {
          var profile = controller.profile.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              SizedBox(height: 2.h),
              Text(
                profile.username ?? 'Unknown User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Joined ${profile.joinedDate ?? 'Unknown Date'}',
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              SizedBox(height: 2.h),
              // Friends & Points
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Add your button action here
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF5A099B),
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      '   Friends   ',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  Text(
                    '✨ ${profile.points ?? 0} ✨ points',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              // Status message
              Text(
                profile.statusMessage ?? '',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              SizedBox(height: 5.h),
              // Toggle switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Auto Create Monthly Playlist',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        'Create playlist of your top tracks in Spotify',
                        style: TextStyle(color: Color.fromARGB(255, 224, 218, 218), fontSize: 11.sp),
                      ),
                      Text(
                        'every month',
                        style: TextStyle(color: Color.fromARGB(255, 224, 218, 218), fontSize: 11.sp),
                      ),
                      SizedBox(height: 1.h),
                      Switch(
                        value: controller.isAutoCreateEnabled.value,
                        onChanged: (value) {
                          controller.toggleAutoCreate(value);
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.blue,
                        inactiveThumbColor: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.white54, thickness: 1),
              Spacer(), // Pushes the logout button to the bottom
              OutlinedButton(
                onPressed: () {
                  controller.logout();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xFF2B004E),
                  side: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
