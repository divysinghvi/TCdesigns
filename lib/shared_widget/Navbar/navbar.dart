import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcdesign/constants/colors/constants.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  CustomNavbar({required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_outlined),
          label: 'Groups',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_toggle_off),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.feedback_outlined),
          label: 'Feedback',
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.LightPurple,
      backgroundColor: AppColors.backgroundColor,
      type: BottomNavigationBarType.fixed,
    );
  }
}
