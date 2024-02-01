import 'package:doga_erp/client/owner/userConfirmController.dart';
import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({
    super.key,
  });

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final UserConfirmController userConfirmController =
      Get.put(UserConfirmController());
  final UsersDbController usersDbController = Get.put(UsersDbController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: usersDbController.names.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              InkWell(
                child: Container(
                  height: context.dynamicHeight(0.08),
                  width: context.dynamicWidth(0.96),
                  decoration: BoxDecoration(
                      color: AppAllColors.lightBackground,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BigText(
                        text: '${usersDbController.names[index]}',
                        color: AppAllColors.darkText,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.to(
                    UserChangeProfile(
                      userNumber: index,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class UserChangeProfile extends StatefulWidget {
  final userNumber;
  const UserChangeProfile({
    super.key,
    required this.userNumber,
  });

  @override
  State<UserChangeProfile> createState() => _UserChangeProfileState();
}

class _UserChangeProfileState extends State<UserChangeProfile> {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.09),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 148,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: 'Adı: ${usersDbController.names[widget.userNumber]}',
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text:
                        'Yetkisi: ${usersDbController.roles[widget.userNumber]}',
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.dynamicWidthSmall(1.3),
                    height: context.dynamicHeightSmall(14),
                    child: TextField(
                      onChanged: (value) {
                        // usersDbController.entryName = value.obs;
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
                        hintText: 'Yeni Şifreyi Girin',
                        hintStyle: TextStyle(
                          color: AppAllColors.lightText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.08),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LightButton(
                      buttonText: 'Değişiklikleri Kaydet',
                      callFunction: () {
                        print('kayededildi');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
