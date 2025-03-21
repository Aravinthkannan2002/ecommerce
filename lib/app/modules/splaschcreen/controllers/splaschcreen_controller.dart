import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(Duration(seconds: 3)); // Delay for 3 seconds
    Get.offNamed('/login'); // Replace with your home route
  }
}
