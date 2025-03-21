import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../controllers/searchpage_controller.dart'; // Make sure to import your controller

class SearchpageView extends GetView<SearchpageController> {
  SearchpageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize =
        screenWidth > 600 ? 120.0 : 100.0; // Larger images for larger screens
    double fontSize =
        screenWidth > 600
            ? 16.0
            : 14.0; // Adjust font size based on screen width
    double padding =
        screenWidth > 600 ? 16.0 : 8.0; // Adjust padding for larger screens

    return Scaffold(
      appBar: AppBar(title: Text('Search View'), centerTitle: true),
      body: Obx(() {
        if (controller.favoriteItems.isEmpty) {
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
                    'No favorite items available.',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                screenWidth > 600
                    ? 3
                    : 2, // Adjust number of columns based on screen width
            crossAxisSpacing: 10, // Horizontal spacing
            mainAxisSpacing: 10, // Vertical spacing
            childAspectRatio: 0.8, // Adjust to control the aspect ratio
          ),
          itemCount: controller.favoriteItems.length,
          itemBuilder: (context, index) {
            final item = controller.favoriteItems[index];
            return Padding(
              padding: EdgeInsets.all(padding),
              child: _FlashSaleItem(
                imageUrl: item.imageUrl ?? '',
                title: item.title ?? 'No Title',
                price: item.price ?? 'N/A',
                rating: item.rating ?? 3.6,
              ),
            );
          },
        );
      }),
    );
  }
}

class _FlashSaleItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final double rating;

  _FlashSaleItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchpageController>();

    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize =
        screenWidth > 600
            ? 120.0
            : 100.0; // Adjust image size for larger screens
    double fontSize =
        screenWidth > 600
            ? 16.0
            : 14.0; // Adjust font size based on screen width

    return GestureDetector(
      onTap: () {
        // Implement navigation to product details page if needed
      },
      child: Stack(
        children: [
          Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl.isNotEmpty
                        ? imageUrl
                        : 'assets/images/default_placeholder.png', // Default image if asset fails
                    height: imageSize,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder:
                      (context, index) => Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 10.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: Obx(() {
              bool isFavorite = controller.isFavorite(title);

              return GestureDetector(
                onTap: () {
                  if (isFavorite) {
                    controller.removeFavorite(title, price, imageUrl);
                  } else {
                    controller.addFavorite(title, price, imageUrl);
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
