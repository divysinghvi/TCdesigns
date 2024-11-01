import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tcdesign/presentations/profile/screens/userprofile.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:(){ Get.to(() => UserPage());},
          child: Container(
            width: 40.sp, // Set width of the square
            height: 40.sp, // Set height of the square
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profile_picture.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.sp), // Curved edges
            ),
          ),
        ),
        Spacer(),
        Icon(Icons.mail, color: Colors.white, size: 40.sp),
      ],
    );
  }
}
