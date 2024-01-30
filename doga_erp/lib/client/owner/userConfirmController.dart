import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:get/get.dart';

class UserConfirmController extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  var notConfirmedUser = [].obs;

  void calcNotConfirmStarts() async {
    calcNotConfirmUsers();
  }

  void calcNotConfirmUsers() async {
    // userDbController.roles index sayısı kadar userDbController.names dizisinin 0. indexinden silmek
    List<String> tempNames = List.from(usersDbController.names);
    for (int i = 0; i < usersDbController.roles.length; i++) {
      tempNames.removeAt(0);
    }
    for (int i = 0; i < tempNames.length; i++) {
      notConfirmedUser.add(tempNames[i]);
      notConfirmedUser.refresh();
    }
  }
}
