import 'package:get/get.dart';

import '../controllers/panier_controller.dart';

class PanierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanierController>(
      () => PanierController(),
    );
  }
}
