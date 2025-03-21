import 'package:ecommerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecommerce/app/modules/searchpage/controllers/searchpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../homewidgets/ProductDetailsPage.dart';

class ClothesView extends GetView {
  final List<Map<String, String>> flashSaleItems;

  const ClothesView({super.key, required this.flashSaleItems});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('ClothesView'), centerTitle: true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      screenWidth > 600
                          ? 3
                          : 2, // More columns for wider screens
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      screenWidth > 600
                          ? 0.6
                          : 0.7, // Adjust aspect ratio based on screen width
                ),
                itemCount: flashSaleItems.length,
                itemBuilder: (context, index) {
                  var item = flashSaleItems[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to product details page
                      Get.to(
                        () => ProductDetailsPage(
                          imageUrl: item['imageUrl']!,
                          title: item['title']!,
                          price: item['price']!,
                          description: item['description']!,
                        ),
                      );
                    },
                    child: _FlashSaleItem(
                      imageUrl: item['imageUrl']!,
                      title: item['title']!,
                      price: item['price']!,
                      description: item['description']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlashSaleItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  const _FlashSaleItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    Key? key,
  }) : super(key: key);

  final double rating = 4.5;

  @override
  Widget build(BuildContext context) {
    final searchController =
        Get.find<SearchpageController>(); // Fetch the SearchPageController

    // Get screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(
        screenWidth * 0.02,
      ), // Padding based on screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Flash sale item content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageUrl,
                  height:
                      screenWidth * 0.3, // Set height relative to screen width
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize:
                      screenWidth *
                      0.04, // Adjust font size based on screen width
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                price,
                style: TextStyle(
                  fontSize:
                      screenWidth *
                      0.04, // Adjust font size based on screen width
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              RatingBarIndicator(
                rating: rating,
                itemBuilder:
                    (context, index) =>
                        const Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize:
                    screenWidth *
                    0.04, // Adjust rating star size based on screen width
                direction: Axis.horizontal,
              ),
            ],
          ),

          // Positioned Favorite Icon
          Positioned(
            top: 8,
            right: 8,
            child: Obx(() {
              bool isFavorite = searchController.isFavorite(title);

              return GestureDetector(
                onTap: () {
                  if (isFavorite) {
                    // Remove from favorites
                    searchController.removeFavorite(title, price, imageUrl);
                  } else {
                    // Add to favorites
                    searchController.addFavorite(
                      title,
                      price,
                      imageUrl,
                      rating: rating,
                    );
                  }
                },
                child: CircleAvatar(
                  radius:
                      screenWidth *
                      0.04, // Adjust circle radius based on screen width
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
