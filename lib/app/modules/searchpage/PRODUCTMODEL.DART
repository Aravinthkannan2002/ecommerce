import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // For RatingBar
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final double rating;

  ProductDetailsPage({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageUrl.startsWith('http')
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Image.asset(imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 10),
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 30.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
