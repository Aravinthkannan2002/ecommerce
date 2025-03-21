import 'package:ecommerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecommerce/app/modules/cart/views/cart_view.dart';
import 'package:ecommerce/app/modules/home/views/home_view.dart';
import 'package:ecommerce/app/modules/profile/views/profile_view.dart';
import 'package:ecommerce/app/modules/searchpage/views/searchpage_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final DashboardController controller = Get.put(DashboardController());
  final CartController CController = Get.put(CartController());
  DashboardView({super.key});

  // List of pages for each tab
  final List<Widget> _pages = [
    HomeView(),
    SearchpageView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen size
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600; // Adjust based on screen size

    return Scaffold(
      body: Obx(() {
        // Using Obx to rebuild the body when selectedIndex changes
        return _pages[controller.selectedIndex.value];
      }),
      bottomNavigationBar: GNav(
        gap: 8,
        activeColor: Colors.red,
        iconSize:
            isLargeScreen ? 24 : 18, // Increase icon size for larger screens
        padding: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 30 : 20,
          vertical: isLargeScreen ? 30 : 25,
        ),
        onTabChange: (index) {
          // Update the selected index when the tab changes
          controller.setSelectedIndex(index);
        },
        tabs: [
          GButton(
            icon: FontAwesomeIcons.home,
            iconSize:
                isLargeScreen ? 24 : 19, // Adjust icon size for larger screens
            text: "Home",
            textStyle: GoogleFonts.teko(
              fontSize:
                  isLargeScreen ? 22 : 18, // Larger text on larger screens
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          GButton(
            icon: FontAwesomeIcons.heart,
            iconSize:
                isLargeScreen ? 24 : 19, // Adjust icon size for larger screens
            text: "Favorites",
            textStyle: GoogleFonts.teko(
              fontSize:
                  isLargeScreen ? 22 : 18, // Larger text on larger screens
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          GButton(
            icon: FontAwesomeIcons.shoppingCart,
            iconSize:
                isLargeScreen ? 24 : 19, // Adjust icon size for larger screens
            text: "Cart",
            textStyle: GoogleFonts.teko(
              fontSize:
                  isLargeScreen ? 22 : 18, // Larger text on larger screens
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          GButton(
            icon: FontAwesomeIcons.user,
            iconSize:
                isLargeScreen ? 24 : 19, // Adjust icon size for larger screens
            text: "Profile",
            textStyle: GoogleFonts.teko(
              fontSize:
                  isLargeScreen ? 22 : 18, // Larger text on larger screens
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
