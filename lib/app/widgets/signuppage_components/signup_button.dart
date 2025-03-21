import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupButton extends StatelessWidget {
  final Function()? onTap;

  const SignupButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding and margin
    final buttonPadding = EdgeInsets.all(
      screenWidth * 0.04,
    ); // 4% of screen width
    final buttonMargin = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.06,
    ); // 6% of screen width

    // Responsive font size
    final buttonTextSize = screenWidth * 0.045; // 4.5% of screen width

    // Responsive border radius
    final buttonBorderRadius = BorderRadius.circular(
      screenWidth * 0.02,
    ); // 2% of screen width

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: buttonPadding,
        margin: buttonMargin,
        decoration: BoxDecoration(
          color:  const Color.fromARGB(255, 211, 44, 44),
          borderRadius: buttonBorderRadius,
        ),
        child: Center(
          child: Text(
            "Sign up",
            style: GoogleFonts.acme(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: buttonTextSize,
            ),
          ),
        ),
      ),
    );
  }
}
