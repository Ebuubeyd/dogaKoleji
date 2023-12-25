import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doğa Koleji ERP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPageCollectorFirst(),
    );
  }
}

class MainPageCollectorFirst extends StatefulWidget {
  const MainPageCollectorFirst({super.key});

  @override
  State<MainPageCollectorFirst> createState() => _MainPageCollectorFirstState();
}

class _MainPageCollectorFirstState extends State<MainPageCollectorFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            WelcomeTextWid(), //Receiving a welcome message for users
            UserInputsWid(), //Empty Input Widget is displayed for Users to Enter Their Own Accounts
            UserLoginButtonWid(), //Button that pulls the login function for the user
          ],
        ),
      ),
    );
  }
}

class WelcomeTextWid extends StatelessWidget {
  const WelcomeTextWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UserInputsWid extends StatefulWidget {
  const UserInputsWid({super.key});

  @override
  State<UserInputsWid> createState() => _UserInputsWidState();
}

class _UserInputsWidState extends State<UserInputsWid> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UserLoginButtonWid extends StatefulWidget {
  const UserLoginButtonWid({super.key});

  @override
  State<UserLoginButtonWid> createState() => _UserLoginButtonWidState();
}

class _UserLoginButtonWidState extends State<UserLoginButtonWid> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
