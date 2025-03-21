import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  // Add item to cart
  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
  }

  // Remove item from cart
  void removeFromCart(int index) {
    cartItems.removeAt(index);
  }

  // Get total cart price
  double get totalPrice {
    double sum = 0;
    for (var item in cartItems) {
      try {
        sum += double.parse(item["price"].toString());
      } catch (e) {
        print("Error parsing price: ${item["price"]}");
      }
    }
    return sum;
  }

  // Clear all items in the cart
  void clearCart() {
    cartItems.clear();
  }
}
