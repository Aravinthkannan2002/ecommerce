import 'package:ecommerce/app/modules/home/homewidgets/carosil_widget.dart';
import 'package:ecommerce/app/modules/home/views/clothes_view.dart';
import 'package:ecommerce/app/modules/home/views/electronics_view.dart';
import 'package:ecommerce/app/modules/home/views/shoes_view.dart';
import 'package:ecommerce/app/modules/home/views/watche_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../searchpage/controllers/searchpage_controller.dart';
import '../controllers/home_controller.dart';
import '../homewidgets/ProductDetailsPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeView extends GetView<HomeController> {
  final SearchpageController _controller = Get.put(SearchpageController());
  HomeView({super.key});

  // List of products for flash sale with asset image paths
  final List<Map<String, String>> flashSaleItems = [
    {
      'imageUrl': 'assets/images/shoe1.png',
      'title': 'Nike Dunk Low',
      'price': '\$288.75',
      'description':
          'This is a limited edition sneaker with a comfortable design and stylish look, perfect for casual wear and sports activities.',
    },
    {
      'imageUrl': 'assets/images/shoe2.png',
      'title': 'Adidas Ultra Boost',
      'price': '\$199.99',
      'description':
          'The Adidas Ultra Boost is known for its exceptional comfort and durability. Great for both running and casual wear.',
    },
    {
      'imageUrl': 'assets/images/shoe3.png',
      'title': 'Puma RS-X3 Puzzle',
      'price': '\$150.00',
      'description':
          'A modern twist on Puma’s classic RS design, this sneaker is perfect for those who love bold colors and a comfortable fit.',
    },
    {
      'imageUrl': 'assets/images/shoe4.png',
      'title': 'New Balance 990v5',
      'price': '\$180.00',
      'description':
          'timeless classic known for its durability, style, and comfort',
    },
    {
      'imageUrl': 'assets/images/shoe5.png',
      'title': 'Converse Chuck Taylor',
      'price': '\$55.00',
      'description':
          'The Converse Chuck Taylor is a timeless classic known for its durability, style, and comfort, perfect for casual outings.',
    },
    {
      'imageUrl': 'assets/images/shoe6.png',
      'title': 'Vans Old Skool',
      'price': '\$65.00',
      'description':
          'The Vans Old Skool sneaker is a favorite for those looking for a retro style with comfort and great quality.',
    },
    {
      'imageUrl': 'assets/images/s7.avif',
      'title': 'Asics Gel-Lyte III',
      'price': '\$110.00',
      'description':
          'The Gel-Lyte III offers a unique split-tongue design and is known for its amazing comfort and performance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New York, USA',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.acme().fontFamily, // Apply Acme font
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade700),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none, // Remove the default border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                style: TextStyle(fontSize: 16),
                cursorColor:
                    Colors.blue, // Change cursor color for better visibility
              ),

              const SizedBox(height: 20),

              // const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle individual category onTap actions
                      switch (categories[index]['label']) {
                        case 'Clothes':
                          Get.to(
                            ClothesView(
                              flashSaleItems: [
                                {
                                  'imageUrl': 'assets/images/shirt1.png',
                                  'title': 'Nike T-Shirt',
                                  'price': '\$39.99',
                                  'description':
                                      'A comfortable and breathable Nike T-shirt, perfect for everyday wear or intense workouts. Made with moisture-wicking fabric for all-day comfort.',
                                },
                                {
                                  'imageUrl': 'assets/images/shirt2.png',
                                  'title': 'Adidas Tee',
                                  'price': '\$29.99',
                                  'description':
                                      'This Adidas Essentials T-shirt is made from soft cotton fabric, offering a relaxed fit and versatility for both casual and active use.',
                                },
                                {
                                  'imageUrl': 'assets/images/shirt3.png',
                                  'title': 'Puma T-Shirt',
                                  'price': '\$25.00',
                                  'description':
                                      'A bold and stylish Puma T-shirt with eye-catching graphics, designed for comfort and an athletic look, perfect for the gym or casual outings.',
                                },
                                {
                                  'imageUrl': 'assets/images/shirt5.png',
                                  'title': 'New Balance',
                                  'price': '\$35.00',
                                  'description':
                                      'A classic New Balance T-shirt made with lightweight, breathable fabric, ideal for any workout or casual day out.',
                                },
                              ],
                            ),
                          ); // Direct navigation to ClothesView

                          break;
                        case 'Electronics':
                          Get.to(
                            ElectronicsView(
                              flashSaleItems: [
                                {
                                  'imageUrl': 'assets/images/elec1.png',
                                  'title': 'Samsung 55" 4K UHD',
                                  'price': '\$499.99',
                                  'description':
                                      'Immerse yourself in the stunning clarity of 4K UHD resolution with this Samsung Smart TV. Equipped with built-in apps and voice control for an exceptional viewing experience.',
                                },
                                {
                                  'imageUrl': 'assets/images/elec2.png',
                                  'title': 'Apple AirPods Pro ',
                                  'price': '\$249.99',
                                  'description':
                                      'Experience superior sound quality and noise cancellation with the Apple AirPods Pro. Perfect for music lovers and professionals on the go.',
                                },
                                {
                                  'imageUrl': 'assets/images/elec3.png',
                                  'title': 'Sony PlayStation ',
                                  'price': '\$499.00',
                                  'description':
                                      'The Sony PlayStation 5 offers lightning-fast loading and incredible graphics for a next-gen gaming experience. Compatible with a wide range of games and accessories.',
                                },
                                {
                                  'imageUrl': 'assets/images/elec4.png',
                                  'title': 'Apple iPad Air ',
                                  'price': '\$599.00',
                                  'description':
                                      'The iPad Air delivers powerful performance with a 10.9-inch Liquid Retina display. Perfect for work, play, and creativity, offering smooth multitasking and responsive touch.',
                                },
                                {
                                  'imageUrl': 'assets/images/elec5.png',
                                  'title': 'Fitbit Charge 5 Fitness ',
                                  'price': '\$129.99',
                                  'description':
                                      'Stay motivated and track your fitness with the Fitbit Charge 5. Features heart rate monitoring, sleep tracking, built-in GPS, and more.',
                                },
                                {
                                  'imageUrl': 'assets/images/elec6.png',
                                  'title': 'Oculus Quest 2 VR ',
                                  'price': '\$299.99',
                                  'description':
                                      'Step into the world of virtual reality with the Oculus Quest 2. It’s an all-in-one VR headset with immersive experiences, offering a library of apps and games.',
                                },
                                {
                                  'imageUrl': 'assets/images/elec7.png',
                                  'title': 'Bose QuietComfort 45  ',
                                  'price': '\$329.00',
                                  'description':
                                      'Bose QuietComfort 45 delivers world-class noise cancellation and rich, immersive sound. Ideal for traveling, working, or just relaxing with your favorite music.',
                                },
                              ],
                            ),
                          ); // Direct navigation to ElectronicsView

                          break;
                        case 'Shoes':
                          Get.to(
                            ShoesView(
                              flashSaleItems: [
                                {
                                  'imageUrl': 'assets/images/shoe1.png',
                                  'title': 'Nike Dunk Low',
                                  'price': '\$288.75',
                                  'description':
                                      'This is a limited edition sneaker with a comfortable design and stylish look, perfect for casual wear and sports activities.',
                                },
                                {
                                  'imageUrl': 'assets/images/shoe2.png',
                                  'title': 'Adidas Ultra Boost',
                                  'price': '\$199.99',
                                  'description':
                                      'The Adidas Ultra Boost is known for its exceptional comfort and durability. Great for both running and casual wear.',
                                },
                                {
                                  'imageUrl': 'assets/images/shoe3.png',
                                  'title': 'Puma RS-X3 Puzzle',
                                  'price': '\$150.00',
                                  'description':
                                      'A modern twist on Puma’s classic RS design, this sneaker is perfect for those who love bold colors and a comfortable fit.',
                                },
                                {
                                  'imageUrl': 'assets/images/s4.jpeg',
                                  'title': 'New Balance 990v5',
                                  'price': '\$180.00',
                                  'description':
                                      'Timeless classic known for its durability, style, and comfort.',
                                },
                                {
                                  'imageUrl': 'assets/images/s5.jpg',
                                  'title': 'Converse Chuck Taylor',
                                  'price': '\$55.00',
                                  'description':
                                      'The Converse Chuck Taylor is a timeless classic known for its durability, style, and comfort, perfect for casual outings.',
                                },
                                {
                                  'imageUrl': 'assets/images/s6.jpg',
                                  'title': 'Vans Old Skool',
                                  'price': '\$65.00',
                                  'description':
                                      'The Vans Old Skool sneaker is a favorite for those looking for a retro style with comfort and great quality.',
                                },
                                {
                                  'imageUrl': 'assets/images/s7.avif',
                                  'title': 'Asics Gel-Lyte III',
                                  'price': '\$110.00',
                                  'description':
                                      'The Gel-Lyte III offers a unique split-tongue design and is known for its amazing comfort and performance.',
                                },
                              ],
                            ),
                          ); // Direct navigation to ShoesView

                          break;
                        case 'Watch':
                          Get.to(
                            WatcheView(
                              flashSaleItems: [
                                {
                                  'imageUrl': 'assets/images/w3.png',
                                  'title': 'Rolex Submariner',
                                  'price': '\$12,000',
                                  'description':
                                      'The Rolex Submariner is a timeless classic with exceptional craftsmanship. Dive into luxury with this iconic timepiece.',
                                },
                                {
                                  'imageUrl': 'assets/images/w2.png',
                                  'title': 'Omega Seamaster',
                                  'price': '\$5,000',
                                  'description':
                                      'The Omega Seamaster offers precision, style, and durability. A must-have for watch enthusiasts who love adventure.',
                                },
                                {
                                  'imageUrl': 'assets/images/w1.png',
                                  'title': 'Tag Heuer Monaco',
                                  'price': '\$3,500',
                                  'description':
                                      'Tag Heuer Monaco combines elegance and performance, perfect for both formal and casual occasions.',
                                },
                                {
                                  'imageUrl': 'assets/images/w4.png',
                                  'title': 'Patek Philippe Nautilus',
                                  'price': '\$30,000',
                                  'description':
                                      'The Patek Philippe Nautilus is a high-end luxury watch renowned for its exquisite design and craftsmanship.',
                                },
                                {
                                  'imageUrl': 'assets/images/w3.png',
                                  'title': 'Audemars Piguet Royal',
                                  'price': '\$20,000',
                                  'description':
                                      'Audemars Piguet Royal Oak is a luxury sports watch with unique design and top-notch functionality.',
                                },
                                {
                                  'imageUrl': 'assets/images/w2.png',
                                  'title': 'Casio G-Shock',
                                  'price': '\$100',
                                  'description':
                                      'Casio G-Shock is the perfect rugged watch for outdoor enthusiasts. Shock-resistant and durable.',
                                },
                              ],
                            ),
                          ); // Direct navigation to WatchView
                          print("Navigating to Watch screen");
                          break;
                        default:
                          print("Tapped on ${categories[index]['label']}");
                      }
                    },
                    child: _CategoryItem(
                      icon: categories[index]['icon'],
                      label: categories[index]['label'],
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Flash Sale Section
              const Text(
                'Flash Sale',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
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
                  var item =
                      flashSaleItems[index]; // Get the product at the current index
                  return _FlashSaleItem(
                    imageUrl: item['imageUrl']!,
                    title: item['title']!,
                    price: item['price']!,
                    description: item['description']!,
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

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CategoryItem({required this.icon, required this.label, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize =
        screenWidth > 600
            ? 20.0
            : 20.0; // Adjust icon size based on screen width
    double fontSize =
        screenWidth > 600 ? 14.0 : 12.0; // Adjust text size for larger screens

    return Column(
      children: [
        CircleAvatar(
          radius: iconSize, // Responsive icon size
          backgroundColor: Colors.redAccent,
          child: Icon(icon, color: Colors.white, size: iconSize),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: fontSize),
        ), // Responsive font size
      ],
    );
  }
}

class _FlashSaleItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  _FlashSaleItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    Key? key,
  }) : super(key: key);

  final double rating = 4.5;

  @override
  Widget build(BuildContext context) {
    final SearchpageController controller = Get.find<SearchpageController>();

    // Get the screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth > 600 ? 150.0 : 100.0; // Adjust image size
    double padding =
        screenWidth > 600 ? 15.0 : 10.0; // Adjust padding for larger screens
    double titleFontSize =
        screenWidth > 600 ? 16.0 : 14.0; // Responsive title font size
    double priceFontSize =
        screenWidth > 600 ? 16.0 : 14.0; // Responsive price font size

    return GestureDetector(
      onTap: () {
        // Navigate to product details page
        Get.to(
          () => ProductDetailsPage(
            imageUrl: imageUrl,
            title: title,
            price: price,
            description: description,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(padding), // Responsive padding
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
                    imageUrl,
                    height: imageHeight, // Responsive image height
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Men's Shoes",
                  style: TextStyle(color: Colors.redAccent, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize, // Responsive title font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: priceFontSize, // Responsive price font size
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

// Category Data
final List<Map<String, dynamic>> categories = [
  {'icon': Icons.shopping_bag, 'label': 'Clothes'},
  {'icon': Icons.devices, 'label': 'Electronics'},
  {'icon': Icons.directions_run, 'label': 'Shoes'},
  {'icon': Icons.watch, 'label': 'Watch'},
];
