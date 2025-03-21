import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/splaschcreen_controller.dart';

class SplaschcreenView extends GetView<SplashScreenController> {
  const SplaschcreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        builder: (controller) {
          return Center(
            child: Lottie.asset(
              'assets/animations/Splashloader.json',
              fit: BoxFit.cover,
              width: size.width * 0.3, // 50% of the screen width
              height: size.height * 0.2, // 30% of the screen height
            ),
          );
        },
      ),
    );
  }
}
