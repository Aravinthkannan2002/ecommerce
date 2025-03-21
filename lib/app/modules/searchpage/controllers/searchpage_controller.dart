import 'package:get/get.dart';

class FavoriteItem {
  final String title;
  final String price;
  final String imageUrl; // Add imageUrl field
  final double rating; // Add rating field

  FavoriteItem({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FavoriteItem &&
        other.title == title &&
        other.price == price;
  }

  @override
  int get hashCode => title.hashCode ^ price.hashCode;
}

class SearchpageController extends GetxController {
  var favoriteItems = <FavoriteItem>[].obs;

  // Method to add a product to the favorites
  void addFavorite(
    String productTitle,
    String price,
    String imageUrl, {
    double rating = 0.0,
  }) {
    var item = FavoriteItem(
      title: productTitle,
      price: price,
      imageUrl: imageUrl,
      rating: rating,
    );
    if (!favoriteItems.contains(item)) {
      favoriteItems.add(item);
    }
  }

  // Method to remove a product from the favorites
  void removeFavorite(String productTitle, String price, String imageUrl) {
    var item = FavoriteItem(
      title: productTitle,
      price: price,
      imageUrl: imageUrl,
      rating: 0.0, // Default rating if not needed
    );
    favoriteItems.remove(item);
  }

  // Check if an item is in favorites
  bool isFavorite(String title) {
    return favoriteItems.any((item) => item.title == title);
  }

  final count = 0.obs;

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
}
