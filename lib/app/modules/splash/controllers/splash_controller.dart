import 'package:get/get.dart';
import 'package:t1/app/modules/login/controllers/login_controller.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final LoginController loginController = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (loginController.getStorage.read('token') != null &&
        loginController.getStorage.read('token') != "") {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
