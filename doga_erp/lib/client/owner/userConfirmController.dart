import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:get/get.dart';

class UserConfirmController extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  var notConfirmedUser = [].obs;

  void calcNotConfirmStarts() async {
    calcNotConfirmUsers();
  }

  void calcNotConfirmUsers() async {}
}//burda düzenleme yapılacak



  // print('bu da çalıştı ${usersDbController.namesCofirmControl}');
  //   if (usersDbController.namesCofirmControl.length ==
  //       usersDbController.names.length) {
  //     for (int i = 0; i < usersDbController.roles.length; i++) {
  //       usersDbController.namesCofirmControl.removeAt(0);
  //     }
  //     notConfirmedUser.add(usersDbController.namesCofirmControl);
  //     notConfirmedUser.refresh();
  //   } else if (usersDbController.namesCofirmControl.length !=
  //       usersDbController.names.length) {
  //     usersDbController.namesCofirmControl = usersDbController.names;
  //     print('çalıştı ${usersDbController.namesCofirmControl}');
  //   }