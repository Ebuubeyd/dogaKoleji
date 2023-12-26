import 'package:doga_erp/pages/securityGuard/serviceFollow.dart';
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
    Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: Text('Sayfa 2'),
    ),
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
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.directions_bus,
            ),
            label: 'Servis Takip',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.people_outline,
            ),
            label: 'Ziyaretçi Takip',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.settings,
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
