import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:get/get.dart';

class UserConfirmController extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  var notConfirmedUser = [].obs;

  void calcNotConfirmStarts() async {
    calcNotConfirmUsers();
  }

  void calcNotConfirmUsers() async {
    notConfirmedUser.clear();
    List<String> tempNames = List.from(usersDbController.names);

    for (int i = 0; i < usersDbController.names.length; i++) {
      if (usersDbController.roles[i] == 'empty') {
        notConfirmedUser.add(tempNames[i]);
        notConfirmedUser.refresh();
        usersDbController.refresh();
      } else {
        print('eşit değildi');
      }
    }
  }
}
