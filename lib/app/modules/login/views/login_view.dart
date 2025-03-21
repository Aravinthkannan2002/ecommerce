import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/loginpage_components/my_button.dart';
import '../../../widgets/loginpage_components/my_textfield.dart';
import '../../../widgets/loginpage_components/square_tile.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive font sizes
    final welcomeTextSize = screenWidth * 0.06; // 6% of screen width
    final subtitleTextSize = screenWidth * 0.04; // 4% of screen width
    final buttonTextSize = screenWidth * 0.045; // 4.5% of screen width
    final forgotPasswordTextSize = screenWidth * 0.035; // 3.5% of screen width
    final orContinueTextSize = screenWidth * 0.04; // 4% of screen width
    final registerTextSize = screenWidth * 0.035; // 3.5% of screen width
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 44, 44),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),

            // Logo Section
            Container(
              height: screenWidth * 0.3, // 30% of screen width
              width: screenWidth * 0.3, // 30% of screen width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.lock,
                size: screenWidth * 0.15, // 15% of screen width
                color:  const Color.fromARGB(255, 211, 44, 44),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Welcome Text
            Text(
              'Welcome Back!',
              style: GoogleFonts.acme(
                fontSize: welcomeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Log in to your account',
              style: GoogleFonts.acme(
                fontSize: subtitleTextSize,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // Login Form Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08, // 8% of screen width
                vertical: screenHeight * 0.05, // 5% of screen height
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(75)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Email TextField with error text
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField(
                          controller: controller.emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),
                        if (controller.emailError.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 30),
                            child: Text(
                              controller.emailError.value,
                              style: GoogleFonts.teko(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  ///paswrd TextField with error text
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField(
                          controller: controller.passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                        if (controller.passwordError.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 30),
                            child: Text(
                              controller.passwordError.value,
                              style: GoogleFonts.teko(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.acme(
                        color: Colors.grey[800],
                        fontSize: forgotPasswordTextSize,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Login Button
                  MyButton(onTap: () => controller.login()),

                  SizedBox(height: screenHeight * 0.04),

                  // Divider with "Or continue with"
                  Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                        ), // 3% of screen width
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.acme(
                            color: Colors.grey[800],
                            fontSize: orContinueTextSize,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Google and Apple Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => print("Google Button"),
                        child: SquareTile(
                          imagePath: 'assets/images/google.png',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      GestureDetector(
                        onTap: () => print("Apple Button"),
                        child: SquareTile(imagePath: 'assets/images/apple.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: GoogleFonts.acme(
                          color: Colors.grey[800],
                          fontSize: registerTextSize,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      GestureDetector(
                        onTap: () => Get.to(SignupView()),
                        child: Text(
                          'Register now',
                          style: GoogleFonts.acme(
                            color:  const Color.fromARGB(255, 211, 44, 44),
                            fontWeight: FontWeight.bold,
                            fontSize: registerTextSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
