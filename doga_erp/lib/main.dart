import 'package:doga_erp/client/signIn_signUp/signIn.dart';
import 'package:doga_erp/client/signIn_signUp/signUp.dart';
import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:doga_erp/firebase_options.dart';
import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
          color: AppAllColors.darkText,
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
  final UsersDbController usersDbController = Get.put(UsersDbController());
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
                  usersDbController.entryName = value.obs;
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
                  usersDbController.entryPass = value.obs;
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
  final SignUpController signUpController = Get.put(SignUpController());
  final SignInControlller signInControlller = Get.put(SignInControlller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: LightButton(
              buttonText: 'Giriş Yap.',
              callFunction: () {
                signInControlller.signInMethodStart();
              }),
        ),
        SizedBox(
          height: context.dynamicHeight(0.03),
        ),
        Center(
          child: LightButton(
              buttonText: 'Kayıt Ol.',
              callFunction: () {
                signUpController.signUpMethodStart();
              }),
        ),
      ],
    );
  }
}
