import 'package:doga_erp/client/security/serviceListController.dart';
import 'package:doga_erp/client/securityAccDen.dart';
import 'package:doga_erp/mediaQuery/mqValues.dart';
import 'package:doga_erp/themes/readyWidgets/bigTextWid.dart';
import 'package:doga_erp/themes/readyWidgets/colors.dart';
import 'package:doga_erp/themes/readyWidgets/lightButtonWid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Column(
          children: [
            ServiceListWid(),
          ],
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
  final SecurityAccDennController securityAccDennController =
      Get.put(SecurityAccDennController());
  final ServiceListController serviceListController =
      Get.put(ServiceListController());

  @override
  void initState() {
    super.initState();

    serviceListController.serviceButtonClicable.listen((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.dynamicWidth(1),
          height: MediaQuery.of(context).size.height / 1.5,
          child: FutureBuilder(
            future: serviceListController.serviceListStart(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child:
                      BigText(text: 'Bir sıkıntı var lütfen yetkiliye ulaşın'),
                );
              } else {
                return ListView.builder(
                  itemCount: serviceListController.serviceNumber.length,
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
                                text:
                                    '${serviceListController.serviceNumber[index]} Numara',
                                color: AppAllColors.darkText,
                              ),
                              BigText(
                                text:
                                    '${serviceListController.servicePlaka[index]}',
                                color: AppAllColors.darkText,
                              ),
                              Container(
                                height: context.dynamicHeight(0.05),
                                width: context.dynamicWidth(0.1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: serviceListController
                                          .serviceButtonClicable[index]
                                      ? AppAllColors.selectedColor
                                      : Colors.grey,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (serviceListController
                                          .serviceButtonClicable[index]) {
                                        print('tıklandı ${index + 1}');
                                        serviceListController
                                                .serviceButtonClicable[index] =
                                            false;
                                      }
                                    });

                                    // Butonun durumunu değiştir
                                    setState(() {
                                      serviceListController
                                          .serviceButtonClicable[index] = false;
                                    });
                                  },
                                  child: Icon(Icons.check),
                                ),
                              ),
                              Container(
                                height: context.dynamicHeight(0.05),
                                width: context.dynamicWidth(0.1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: serviceListController
                                          .serviceButtonClicable[index]
                                      ? AppAllColors.rejectButton
                                      : Colors.grey,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (serviceListController
                                          .serviceButtonClicable[index]) {
                                        print('red ${index + 1}');
                                        serviceListController
                                                .serviceButtonClicable[index] =
                                            false;
                                      }
                                    });

                                    // Butonun durumunu değiştir
                                    setState(() {
                                      serviceListController
                                          .serviceButtonClicable[index] = false;
                                    });
                                    // securityAccDennController.denyButton(index + 1);
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
                );
              }
            },
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.01),
        ),
        Container(
          child: LightButton(
            buttonText: 'Gün Sonu raporu Al.',
            callFunction: () {
              for (var i = 0;
                  i < serviceListController.serviceButtonClicable.length;
                  i++) {
                setState(() {
                  if (serviceListController.serviceButtonClicable[i] == false) {
                    serviceListController.serviceButtonClicable[i] = true;
                  }
                });
              }
            },
            height: context.dynamicHeight(0.08),
          ),
        ),
      ],
    );
  }
}
