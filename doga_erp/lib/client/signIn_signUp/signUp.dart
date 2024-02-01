import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  final database = FirebaseDatabase.instance;

  void signUpMethodStart() async {
    await checkAccount(
        usersDbController.entryName, usersDbController.entryPass);
  }

  Future<void> checkAccount(var namep, var passp) async {
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
            found = true;
            break;
          }
        }
      } else {
        print('Hatalı veri yapısı: $dynamicData');
      }

      if (!found) {
        await database.ref('users').push().set({
          'name': '${namep.value}',
          'password': '${passp.value}',
          'role': 'empty'
        });
      }
    }
  }
}
