import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart'; // Import Sizer
import 'package:tcdesign/presentations/History/controller/history_controller.dart';
import 'package:tcdesign/presentations/History/screens/detail_page.dart';
import 'package:tcdesign/presentations/home/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer( // Wrap your app with Sizer
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter GetX Navigation',
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          getPages: [
            GetPage(name: '/home', page: () => HomePage()),
            GetPage(name: '/detail', page: () => AwardDetailsPage(history: Get.arguments,)),
          ],
        );
      },
    );
  }
}
