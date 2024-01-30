import 'package:get/get.dart';

class UsersDbController extends GetxController {
  var entryName = ''.obs;
  var entryPass = ''.obs;
  var names = [
    'ebu',
    'ali',
    'veli',
    'batu',
    'deneme',
    'test',
  ].obs;
  var namesCofirmControl = [
    'ebu',
    'ali',
    'veli',
    'batu',
    'deneme',
  ].obs;
  var passList = [
    '1234',
    '1224',
    '1130',
    '1532',
  ].obs;
  var roles = [
    'owner',
    'securtiy',
    'visitor',
    'stajyer',
  ];
}
