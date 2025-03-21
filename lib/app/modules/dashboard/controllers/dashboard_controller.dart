import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Make _selectedIndex observable
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;  // Update the index value reactively
  }
}
