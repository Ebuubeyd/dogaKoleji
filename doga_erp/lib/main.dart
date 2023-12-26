import 'package:doga_erp/client/UserProcess.dart';
import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
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
            const WelcomeTextWid(), //Receiving a welcome message for users
            SizedBox(
              height: context.dynamicHeight(0.20),
            ),
            const UserInputsWid(), //Empty Input Widget is displayed for Users to Enter Their Own Accounts
            SizedBox(
              height: context.dynamicHeight(0.05),
            ),
            const UserLoginButtonWid(), //Button that pulls the login function for the user
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
    return Container(
      color: AppAllColors.lightBackground,
      child: const Center(
        child: BigText(
          text: 'Doğa Kolejine Hoş geldiniz :)',
          size: 26,
        ),
      ),
    );
  }
}

class UserInputsWid extends StatefulWidget {
  const UserInputsWid({super.key});

  @override
  State<UserInputsWid> createState() => _UserInputsWidState();
}

class _UserInputsWidState extends State<UserInputsWid> {
  final UserProcessController userProcessController =
      Get.put(UserProcessController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.dynamicWidthSmall(1.3),
              height: context.dynamicHeightSmall(14),
              child: TextField(
                onChanged: (value) {
                  userProcessController.kadi = value.obs;
                },
                style: const TextStyle(
                  color: AppAllColors.lightText,
                ),
                cursorColor: AppAllColors.selectedColor,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppAllColors.lightText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppAllColors.selectedColor,
                    ),
                  ),
                  hintText: 'Kullanıcı Adı Girin',
                  hintStyle: TextStyle(
                    color: AppAllColors.lightText,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.dynamicHeight(0.015),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.dynamicWidthSmall(1.3),
              height: context.dynamicHeightSmall(14),
              child: TextField(
                onChanged: (value) {
                  userProcessController.sif = value.obs;
                },
                style: const TextStyle(
                  color: AppAllColors.lightText,
                ),
                cursorColor: AppAllColors.selectedColor,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppAllColors.lightText,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppAllColors.selectedColor,
                    ),
                  ),
                  hintText: 'Şifre Girin',
                  hintStyle: TextStyle(
                    color: AppAllColors.lightText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UserLoginButtonWid extends StatefulWidget {
  const UserLoginButtonWid({super.key});

  @override
  State<UserLoginButtonWid> createState() => _UserLoginButtonWidState();
}

class _UserLoginButtonWidState extends State<UserLoginButtonWid> {
  final UserProcessController userProcessController =
      Get.put(UserProcessController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: LightButton(
            buttonText: 'Giriş Yap.',
            callFunction: () => userProcessController.userInformationControl(
                // userProcessController.kadi,
                // userProcessController.sif,
                ),
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.03),
        ),
        Center(
          child: LightButton(
            buttonText: 'Kayıt Ol.',
            callFunction: () =>
                userProcessController.userSignUpInformationControl(
                    // userProcessController.kadi,
                    // userProcessController.sif,
                    ),
          ),
        ),
      ],
    );
  }
}
