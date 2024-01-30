import 'package:doga_erp/client/owner/userConfirmController.dart';
import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserConfirm extends StatefulWidget {
  const UserConfirm({super.key});

  @override
  State<UserConfirm> createState() => _UserConfirmState();
}

class _UserConfirmState extends State<UserConfirm> {
  final UserConfirmController userConfirmController =
      Get.put(UserConfirmController());
  @override
  Widget build(BuildContext context) {
    userConfirmController.calcNotConfirmStarts();
    return Container(
      width: context.dynamicWidth(1),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: userConfirmController.notConfirmedUser.length,
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
                        text:
                            '${userConfirmController.notConfirmedUser[index]}',
                        color: AppAllColors.darkText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
