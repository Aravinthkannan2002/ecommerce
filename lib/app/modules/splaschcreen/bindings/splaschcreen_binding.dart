import 'package:get/get.dart';

import '../controllers/splaschcreen_controller.dart';

class SplaschcreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
    );
  }
}
