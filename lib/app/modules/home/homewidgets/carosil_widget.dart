import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OfferCarousel extends StatelessWidget {
  final List<String> images = [
    "assets/images/b1.png", // Replace with your asset images
    "assets/images/b2.png",
    "assets/images/b3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
      ),
      items:
          images.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
    );
  }
}
