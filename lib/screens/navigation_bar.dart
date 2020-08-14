import 'package:churchapp/screens/status_screen.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';

import 'bookin_screen.dart';

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {

  //declare primary color
  final Color primaryColor = Color(0xff18203d);

  int currentPage = 0;
  final List<Widget> _pages = [
    BookASeat(),
    BookingStatus(),
    //Add pages to appear on the App, via Navigation Bar
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 40,
        circleSize: 45,
        initialSelection: currentPage,
        inactiveIconColor: primaryColor,
        textColor: primaryColor,
        hasElevationShadows: false,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 30,
            title: 'Home',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.history,
            iconSize: 25,
            title: 'Status',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}
