import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:doga_erp/pages/owner/ownerHomePage.dart';
import 'package:doga_erp/pages/securityGuard/securityGuardHomePage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class SignInControlller extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  final database = FirebaseDatabase.instance;
  void signInMethodStart() async {
    checkAcoountUp(usersDbController.entryName, usersDbController.entryPass);
  }

  Future checkAcoountUp(namep, passp) async {
    final usersReference = database.ref('users');

    if (namep.value.isEmpty || passp.value.isEmpty) {
    } else {
      bool found = false;

      final event = await usersReference.onValue.first;

      final dynamicData = event.snapshot.value;

      if (dynamicData is Map<Object?, Object?>) {
        final usersSnapshot = dynamicData;
        for (final userId in usersSnapshot.keys) {
          final user = usersSnapshot[userId] as Map<Object?, Object?>;
          if (namep == user['name']) {
            if (passp == user['password']) {
              if (user['role'] == 'owner') {
                Get.to(
                  OwnerHomePage(),
                );
              } else if (user['role'] == 'securtiy') {
                print('bu bir güvenlik');
                Get.to(
                  SecurtiyGuardHomePage(),
                );
              } else if (user['role'] == 'teacher') {
                print('bu bir öğretmen');
              } else if (user['role'] == 'visitor') {
                print('bu bir danışman');
              } else if (user['role'] == 'stajyer') {
                print('Bu bir stajyer');
              }
            }
            found = true;
            break;
          }
        }
      }

      if (!found) {}
    }
  }
}
