import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce/app/modules/searchpage/controllers/searchpage_controller.dart';

import '../homewidgets/ProductDetailsPage.dart'; // Import the ProductDetailsPage

class WatcheView extends GetView {
  final List<Map<String, String>> flashSaleItems;

  const WatcheView({super.key, required this.flashSaleItems});

  @override
  Widget build(BuildContext context) {
    final searchController =
        Get.find<SearchpageController>(); // Fetch the SearchPageController

    return Scaffold(
      appBar: AppBar(title: const Text('WatcheView'), centerTitle: true),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: flashSaleItems.length,
                itemBuilder: (context, index) {
                  var item = flashSaleItems[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ProductDetailsPage and pass the item details
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

    return Container(
      padding: const EdgeInsets.all(10),
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
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
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
                itemSize: 12.0,
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
                  radius: 18,
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
