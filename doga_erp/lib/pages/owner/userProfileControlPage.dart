import 'package:doga_erp/client/owner/userConfirmController.dart';
import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileControlPage extends StatefulWidget {
  final userName;
  final userPass;
  final userRole;
  const UserProfileControlPage({
    super.key,
    required this.userName,
    required this.userPass,
    required this.userRole,
  });

  @override
  State<UserProfileControlPage> createState() => _UserProfileControlPageState();
}

class _UserProfileControlPageState extends State<UserProfileControlPage> {
  final UserConfirmController userConfirmController =
      Get.put(UserConfirmController());
  var selectedValue = 'empty';

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
                    text: 'Adı: ${widget.userName}',
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    dropdownColor: AppAllColors.darkBackground,
                    items: [
                      DropdownMenuItem(
                        child: BigText(
                          text: 'Yetkisiz',
                        ),
                        value: 'empty',
                      ),
                      DropdownMenuItem(
                        child: BigText(
                          text: 'Yönetici',
                        ),
                        value: 'owner',
                      ),
                      DropdownMenuItem(
                        child: BigText(
                          text: 'Güvenlik',
                        ),
                        value: 'securtiy',
                      ),
                    ],
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        // userConfirmController.userRoleChange(
                        //     );
                        // usersDbController.roles[widget.userNumber] =
                        //     selectedValue;
                      });
                    },
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
                      buttonText: 'Kaydet',
                      callFunction: () {
                        userConfirmController.userRoleChange(
                            selectedValue, widget.userName);
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
