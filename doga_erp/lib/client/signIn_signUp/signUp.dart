import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());

  void signUpMethodStart() {
    checkAccount(usersDbController.entryName, usersDbController.entryPass);
  }

  void checkAccount(var name, var pass) async {
    if (name.value.isEmpty || pass.value.isEmpty) {
      print('boş bırakmayın');
    } else {
      bool found = false;

      for (String checkName in usersDbController.names) {
        if (checkName == usersDbController.entryName.value) {
          print('Böyle bir kullanıcı mevcut');
          found = true;
          break;
        }
      }

      if (!found) {
        found = false;
        usersDbController.names.add(name.value);
        usersDbController.namesCofirmControl.add(name.value);
        usersDbController.passList.add(pass.value);
        usersDbController.names.refresh();
        usersDbController.namesCofirmControl.refresh();
        usersDbController.passList.refresh();
        print('Kayıt isteği gönderildi');
      }
    }
  }
}
