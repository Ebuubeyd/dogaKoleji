import 'package:doga_erp/pages/securityGuard/securityGuardHomePage.dart';
import 'package:get/get.dart';

class UserProcessController extends GetxController {
  var kadi = ''.obs;
  var sif = ''.obs;

  userInformationControl(/*var kadi, var sif*/) {
    print('Empty User');
    Get.to(
      SecurtiyGuardHomePage(),
      // fullscreenDialog: true,
    );
  }

  userSignUpInformationControl(/*var kadi, var sif*/) {
    print('Empty User');
    Get.to(
      SecurtiyGuardHomePage(),
    );
  }
}
