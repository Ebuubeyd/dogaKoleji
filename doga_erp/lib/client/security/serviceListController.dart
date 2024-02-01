import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceListController extends ChangeNotifier {
  final database = FirebaseDatabase.instance;
  var serviceNumber = [].obs;
  var servicePlaka = [].obs;
  var serviceButtonClicable = [].obs;

  Future serviceListStart() async {
    await serviceListGetter();
  }

  Future serviceListGetter() async {
    final busListReference = database.ref('busList');
    final event = await busListReference.onValue.first;

    final dynamicData = event.snapshot.value;

    if (dynamicData is List) {
      serviceNumber.clear();
      servicePlaka.clear();
      for (var service in dynamicData) {
        if (service is Map && service.containsKey('Plaka')) {
          serviceNumber.add(service['servisNo']);
          servicePlaka.add(service['Plaka']);
          serviceButtonClicable.add(true);
          serviceNumber.refresh();
          servicePlaka.refresh();
          serviceButtonClicable.refresh();
        }
      }
    } else {
      print("Veri yapısı beklenen gibi bir liste değil.");
    }
  }
}
