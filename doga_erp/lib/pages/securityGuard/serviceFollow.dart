import 'package:doga_erp/themes/readyWidgets/colors.dart';
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
        child: Column(
          children: [],
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
    return Container();
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
    return Container();
  }
}
