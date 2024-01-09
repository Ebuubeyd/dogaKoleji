import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
import 'package:flutter/material.dart';

class VisitorFollowCollectorWid extends StatefulWidget {
  const VisitorFollowCollectorWid({super.key});

  @override
  State<VisitorFollowCollectorWid> createState() =>
      _VisitorFollowCollectorWidState();
}

class _VisitorFollowCollectorWidState extends State<VisitorFollowCollectorWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            VisitorListWid(),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            VisitorEndOfDayReportWid(),
          ],
        ),
      ),
    );
  }
}

class VisitorListWid extends StatefulWidget {
  const VisitorListWid({super.key});

  @override
  State<VisitorListWid> createState() => _VisitorListWidState();
}

class _VisitorListWidState extends State<VisitorListWid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.builder(
        itemCount: 24,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Container(
                height: context.dynamicHeight(0.08),
                width: context.dynamicWidth(0.96),
                decoration: BoxDecoration(
                    color: AppAllColors.lightBackground,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(
                      text: 'Zafer',
                      color: AppAllColors.darkText,
                    ),
                    BigText(
                      text: 'Aygün',
                      color: AppAllColors.darkText,
                    ),
                    Container(
                      height: context.dynamicHeight(0.05),
                      width: context.dynamicWidth(0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppAllColors.selectedColor,
                      ),
                      child: InkWell(
                        onTap: () {
                          print('servis Geldi ${index}');
                        },
                        child: Icon(Icons.check),
                      ),
                    ),
                    Container(
                      height: context.dynamicHeight(0.05),
                      width: context.dynamicWidth(0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppAllColors.rejectButton,
                      ),
                      child: InkWell(
                        onTap: () {
                          print('servis Gelmedi ${index}');
                        },
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class VisitorEndOfDayReportWid extends StatefulWidget {
  const VisitorEndOfDayReportWid({super.key});

  @override
  State<VisitorEndOfDayReportWid> createState() =>
      _VisitorEndOfDayReportWidState();
}

class _VisitorEndOfDayReportWidState extends State<VisitorEndOfDayReportWid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LightButton(
        buttonText: 'Gün Sonu raporu Al.',
        callFunction: () => print('Gün sonu raporu alındı'),
        height: context.dynamicHeight(0.08),
      ),
    );
  }
}
