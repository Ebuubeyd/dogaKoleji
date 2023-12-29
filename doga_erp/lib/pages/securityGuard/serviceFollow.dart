import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
import 'package:flutter/material.dart';

class ServiceFollowCollectorWid extends StatefulWidget {
  const ServiceFollowCollectorWid({super.key});

  @override
  State<ServiceFollowCollectorWid> createState() =>
      ServiceFollowCollectorWidState();
}

class ServiceFollowCollectorWidState extends State<ServiceFollowCollectorWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAllColors.darkBackground,
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              ServiceListWid(),
              SizedBox(
                height: context.dynamicHeight(0.01),
              ),
              EndOfDayReportWid(),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceListWid extends StatefulWidget {
  const ServiceListWid({super.key});

  @override
  State<ServiceListWid> createState() => _ServiceListWidState();
}

class _ServiceListWidState extends State<ServiceListWid> {
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
                    BigText(text: '17 Numara'),
                    BigText(text: '16 S 6995'),
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

class EndOfDayReportWid extends StatefulWidget {
  const EndOfDayReportWid({super.key});

  @override
  State<EndOfDayReportWid> createState() => _EndOfDayReportWidState();
}

class _EndOfDayReportWidState extends State<EndOfDayReportWid> {
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
