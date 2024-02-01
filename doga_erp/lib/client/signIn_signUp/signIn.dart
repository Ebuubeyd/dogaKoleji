import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:doga_erp/pages/owner/ownerHomePage.dart';
import 'package:doga_erp/pages/securityGuard/securityGuardHomePage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class SignInControlller extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());

  void signInMethodStart() async {
    checkAcoountUp(usersDbController.entryName, usersDbController.entryPass,
        usersDbController.roles);
    deneme();
  }

  void deneme() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/id2/name').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  void checkAcoountUp(name, pass, role) async {
    print(usersDbController.names);
    if (name.value.isEmpty || pass.value.isEmpty) {
      print('boş bırakmayın');
    } else {
      bool found = false;

      for (String checkName in usersDbController.names) {
        if (checkName == usersDbController.entryName.value) {
          if (usersDbController.entryPass ==
              usersDbController
                  .passList[usersDbController.names.indexOf(checkName)]) {
            if (role[usersDbController.names.indexOf(checkName)] == 'owner') {
              print('bu bir owner');
              Get.to(
                OwnerHomePage(),
              );
            } else if (role[usersDbController.names.indexOf(checkName)] ==
                'securtiy') {
              print('bu bir güvenlik');
              Get.to(
                SecurtiyGuardHomePage(),
              );
            } else if (role[usersDbController.names.indexOf(checkName)] ==
                'teacher') {
              print('bu bir öğretmen');
            } else if (role[usersDbController.names.indexOf(checkName)] ==
                'visitor') {
              print('bu bir danışman');
            } else if (role[usersDbController.names.indexOf(checkName)] ==
                'stajyer') {
              print('bu bir stajyer');
            }
          }
          found = true;
          break;
        }
      }

      if (!found) {
        print('yok aga');
      }
    }
  }
}
