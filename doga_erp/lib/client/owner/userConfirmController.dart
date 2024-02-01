import 'package:doga_erp/client/signIn_signUp/usersDb.dart';
import 'package:doga_erp/pages/owner/ownerHomePage.dart';
import 'package:doga_erp/pages/owner/userProfileControlPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class UserConfirmController extends GetxController {
  final UsersDbController usersDbController = Get.put(UsersDbController());
  final database = FirebaseDatabase.instance;

  var notConfirmedUser = [].obs;

  Future calcNotConfirmStarts() async {
    await calcNotConfirmUsers();
  }

  Future calcNotConfirmUsers() async {
    final usersReference = await database.ref('users');

    final event = await usersReference.onValue.first;
    final dynamicData = await event.snapshot.value;
    if (dynamicData is Map<Object?, Object?>) {
      notConfirmedUser.clear();

      final usersSnapshot = await dynamicData;

      for (final userId in usersSnapshot.keys) {
        final user = await usersSnapshot[userId] as Map<Object?, Object?>;

        if (user['role'] == 'empty') {
          notConfirmedUser.add(user['name']);
          notConfirmedUser.refresh();
        }
      }
    }
  }

  void userSelectRoleChange(userName) async {
    final usersReference = database.ref('users');
    final event = await usersReference.onValue.first;

    final dynamicData = event.snapshot.value;
    if (dynamicData is Map<Object?, Object?>) {
      final usersSnapshot = dynamicData;
      for (final userId in usersSnapshot.keys) {
        final user = usersSnapshot[userId] as Map<Object?, Object?>;
        if (userName == user['name']) {
          print('bu neymiş babuş ${user['role']}');
          Get.to(
            UserProfileControlPage(
              userName: user['name'],
              userPass: user['password'],
              userRole: user['role'],
            ),
          );
        }
      }
    }
  }

  void userRoleChange(role, userName) async {
    print(role);
    final usersReference = database.ref('users');
    final snapshot = await usersReference.get();

    if (snapshot.exists) {
      final usersData = snapshot.value as Map<String, dynamic>;
      for (final userId in usersData.keys) {
        // userId'nin türünün String olduğundan emin olun:
        String userIdString = userId as String;

        final user = usersData[userIdString] as Map<String, dynamic>;
        if (userName == user['name']) {
          await usersReference.child(userIdString).update({'role': role});
          Get.to(
            OwnerHomePage(),
          );
        }
      }
    } else {
      print('Kullanıcı bulunamadı.');
    }
  }
}
