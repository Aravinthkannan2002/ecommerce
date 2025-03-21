import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive count variable
  final count = 0.obs;

  // List to hold favorite items
  RxList<Map<String, String>> favorites = <Map<String, String>>[].obs;

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

  void increment() => count.value++;

  // Check if a product is in the favorites
  bool isFavorite(String title) {
    return favorites.any((item) => item['title'] == title);
  }

  // Add product to favorites with named parameters
  void addFavorite({
    required String title,
    required String price,
    required String imageUrl,
  }) {
    favorites.add({
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
    });
  }

  // Remove product from favorites with named parameter
  void removeFavorite({required String title}) {
    favorites.removeWhere((item) => item['title'] == title);
  }
}
