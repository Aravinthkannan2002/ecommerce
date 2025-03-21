import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/homewidgets/ProductDetailsPage.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize =
        screenWidth > 600 ? 70.0 : 50.0; // Adjust image size for larger screens
    double fontSize =
        screenWidth > 600 ? 16.0 : 14.0; // Adjust font size for larger screens
    double padding =
        screenWidth > 600 ? 16.0 : 8.0; // Adjust padding for larger screens

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart'), centerTitle: true),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/nodata.png', // Replace with your image path
                    width: 150, // Adjust size as needed
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'No cart items available.',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            ),
          ); // Image for empty cart
        }
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return ListTile(
              onTap: () {
                Get.to(
                  () => ProductDetailsPage(
                    imageUrl: item['imageUrl'] ?? '', // Ensure it’s not null
                    title: item['title'] ?? 'No Title',
                    price: item['price']?.toString() ?? '0',
                    description:
                        item['description'] ?? 'No Description Available',
                  ),
                );
              },
              leading: Image.asset(
                item['imageUrl'],
                width: imageSize,
                height: imageSize,
              ),
              title: Text(item['title'], style: TextStyle(fontSize: fontSize)),
              subtitle: Text(
                "\$${item['price']}",
                style: TextStyle(fontSize: fontSize),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.removeFromCart(index),
              ),
            );
          },
        );
      }),
    );
  }
}
