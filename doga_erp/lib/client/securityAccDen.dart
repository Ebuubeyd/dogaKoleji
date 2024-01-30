import 'package:get/get.dart';

class SecurityAccDennController extends GetxController {
  var dateAndTime = DateTime.now();
  void acceptButton(index) {
    print('servis Geldi ${index}');
    print(
        '${dateAndTime.year} yılının ${dateAndTime.month}. ayının ${dateAndTime.day}. günü Saat ${dateAndTime.hour}:${dateAndTime.minute} de ${index} numaralı servis Okula giriş yaptı');

    //tarih verisi çekilecek
    //saat verisi çekilecek
    //hangi servis için butona tıklandığı yada hangi olay olduğu çekilecek
    //bu maddelerin onaylandığı belirlenecek
    //veriler veri tabanına Aynı liste ile gönderilecek
  }

  void denyButton(index) {
    print('servis Gelmedi ${index}');
    print(
        '${dateAndTime.year} yılının ${dateAndTime.month}. ayının ${dateAndTime.day}. günü Saat ${dateAndTime.hour}:${dateAndTime.minute} de ${index} numaralı servis Okula giriş yapmadı');
    //tarih verisi çekilecek
    //saat verisi çekilecek
    //hangi servis için butona tıklandığı yada hangi olay olduğu çekilecek
    //bu maddelerin rededdildiği belirlenecek
    //veriler veri tabanına Aynı liste ile gönderilecek
  }
}
