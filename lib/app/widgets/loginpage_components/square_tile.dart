import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive padding
    final tilePadding =
        EdgeInsets.all(screenWidth * 0.04); // 4% of screen width

    // Responsive border radius
    final tileBorderRadius =
        BorderRadius.circular(screenWidth * 0.04); // 4% of screen width

    // Responsive image height
    final imageHeight = screenWidth * 0.1; // 10% of screen width

    return Container(
      padding: tilePadding,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: tileBorderRadius,
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: imageHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
