import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  final database = FirebaseDatabase.instance;
  var userNameList = [].obs;
  var userRoleList = [].obs;

  Future userListControllerStart() async {
    await getUserList();
  }

  Future getUserList() async {
    final usersReference = await database.ref('users');
    final event = await usersReference.onValue.first;
    final dynamicData = await event.snapshot.value;
    if (dynamicData is Map<Object?, Object?>) {
      userNameList.clear();
      userRoleList.clear();
      final usersSnapshot = await dynamicData;
      for (final userId in usersSnapshot.keys) {
        final user = await usersSnapshot[userId] as Map<Object?, Object?>;
        userNameList.add(user['name']);
        userRoleList.add(user['role']);
        userNameList.refresh();
        userRoleList.refresh();
      }
    }
  }
}
