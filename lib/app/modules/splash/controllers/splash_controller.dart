import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final GetStorage getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read('status') != null && getStorage.read('status') != "") {
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
