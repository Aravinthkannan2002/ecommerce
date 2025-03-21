import 'package:ecommerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  ProductDetailsPage({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    Key? key,
  }) : super(key: key);

  final CartController cartController = Get.put(CartController());
  final RxInt quantity = 1.obs; // Quantity state

  @override
  Widget build(BuildContext context) {
    // Get device screen size
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                height: height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(width * 0.05),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 20),
                        const Text(
                          " 5.0  ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(1154 Reviews)",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Select Colour :",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        _colorOption("Orange", Colors.orange),
                        _colorOption("Milk", Colors.grey.shade300),
                        _colorOption("Red", Colors.redAccent, isSelected: true),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Size :",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      spacing: 10,
                      children:
                          ["42", "43", "44", "45", "46", "47", "48"]
                              .map(
                                (size) =>
                                    _sizeOption(size, selected: size == "44"),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 20),

                    /// **Quantity Selector**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Quantity:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity.value > 1) {
                                  quantity.value--;
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                            Obx(
                              () => Text(
                                "${quantity.value}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                quantity.value++;
                              },
                              icon: const Icon(Icons.add, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// **Price & Add to Cart**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$$price",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cartController.addToCart({
                              "title": title,
                              "imageUrl": imageUrl,
                              "price": price,
                              "quantity": quantity.value,
                            });

                            Get.snackbar(
                              "Added to Cart",
                              "$title (x${quantity.value}) has been added to your cart!",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green.withOpacity(0.8),
                              colorText: Colors.white,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.1,
                              vertical: height * 0.02,
                            ),
                          ),
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Added space at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Color Option Widget**
  Widget _colorOption(String label, Color color, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
        selected: isSelected,
        backgroundColor: color.withOpacity(0.3),
        selectedColor: color,
        onSelected: (_) {},
      ),
    );
  }

  /// **Size Option Widget**
  Widget _sizeOption(String size, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.redAccent : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 16,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
