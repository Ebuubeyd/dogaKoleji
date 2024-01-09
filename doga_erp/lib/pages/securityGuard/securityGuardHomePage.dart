import 'package:doga_erp/pages/securityGuard/serviceFollow.dart';
import 'package:doga_erp/pages/securityGuard/visitorFollow.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:flutter/material.dart';

class SecurtiyGuardHomePage extends StatefulWidget {
  const SecurtiyGuardHomePage({super.key});

  @override
  State<SecurtiyGuardHomePage> createState() => _SecurtiyGuardHomePageState();
}

class _SecurtiyGuardHomePageState extends State<SecurtiyGuardHomePage> {
  var selectedIndex = 0;
  final List<Widget> bottomBarItems = [
    ServiceFollowCollectorWid(),
    VisitorFollowCollectorWid(),
    Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: Text('Sayfa 2'),
    ),
    Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: Text('Sayfa 2'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppAllColors.darkText,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.directions_bus,
              color: AppAllColors.darkText,
            ),
            label: 'Servis Takip',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.people_outline,
              color: AppAllColors.darkText,
            ),
            label: 'Ziyaretçi Takip',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.account_circle,
              color: AppAllColors.darkText,
            ),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.settings,
              color: AppAllColors.darkText,
            ),
            label: 'Ayarlar',
          ),
        ],
        backgroundColor: AppAllColors.lightBackground,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: bottomBarItems[selectedIndex],
    );
  }
}
