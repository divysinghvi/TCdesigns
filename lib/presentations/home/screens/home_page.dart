import 'package:flutter/material.dart';
import 'package:tcdesign/shared_widget/Navbar/navbar.dart';
import 'package:tcdesign/shared_widget/random.dart';
import '../../Groups/screens/group_page.dart';
import '../../History/screens/history_page.dart';
import 'homebody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeBody(),
    GroupsPage(),
    HistoryPage(),
    FeedbackPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
