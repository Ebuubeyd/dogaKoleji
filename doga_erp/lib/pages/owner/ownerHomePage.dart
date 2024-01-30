import 'package:doga_erp/pages/owner/userConfirm.dart';
import 'package:doga_erp/pages/owner/userListPage.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:flutter/material.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  var selectedIndex = 0;
  final List<Widget> bottomBarItems = [
    UserConfirm(),
    UserListPage(),
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
              Icons.add_moderator,
              color: AppAllColors.darkText,
            ),
            label: 'Kullanıcı Onay',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppAllColors.lightBackground,
            icon: Icon(
              Icons.people_outline,
              color: AppAllColors.darkText,
            ),
            label: 'Kullanıcı Listesi',
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
