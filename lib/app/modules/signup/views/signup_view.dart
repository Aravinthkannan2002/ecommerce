import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/loginpage_components/square_tile.dart';
import '../../../widgets/signuppage_components/signup_button.dart';
import '../../../widgets/signuppage_components/signup_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
    final SignupController controller = Get.put(SignupController());
   SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive font sizes
    final welcomeTextSize = screenWidth * 0.06; // 6% of screen width
    final subtitleTextSize = screenWidth * 0.04; // 4% of screen width
    final buttonTextSize = screenWidth * 0.045; // 4.5% of screen width
    final orContinueTextSize = screenWidth * 0.04; // 4% of screen width
    final loginTextSize = screenWidth * 0.035; // 3.5% of screen width
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
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02), // 2% of screen width
              child: Text(
                'Let\'s create an Account For You!',
                style: GoogleFonts.acme(
                  fontSize: welcomeTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // Signup Form Section
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
                  // Signup Form Section
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Email TextField
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              signup_textfield(
                                controller: controller.emailController,
                                hintText: 'Email',
                                obscureText: false,
                              ),
                              SizedBox(height: screenHeight * 0.01),

                              // Display error message for invalid email
                              if (controller.emailError.value.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 30,
                                  ),
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

                        // Password TextField
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              signup_textfield(
                                controller: controller.passwordController,
                                hintText: 'Password',
                                obscureText: true,
                              ),
                              SizedBox(height: screenHeight * 0.01),

                              // Display error message for invalid password
                              if (controller.passwordError.value.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 30,
                                  ),
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
                        SizedBox(height: screenHeight * 0.02),

                        // Confirm Password TextField
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              signup_textfield(
                                controller:
                                    controller.confirmPasswordController,
                                hintText: 'Confirm Password',
                                obscureText: true,
                              ),
                              SizedBox(height: screenHeight * 0.01),

                              // Display error message for confirm password mismatch
                              if (controller
                                  .confirmPasswordError
                                  .value
                                  .isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 30,
                                  ),
                                  child: Text(
                                    controller.confirmPasswordError.value,
                                    style: GoogleFonts.teko(
                                      color: Colors.red,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),

                        // Signup Button
                        SignupButton(onTap: controller.signUserIn),
                        SizedBox(height: screenHeight * 0.05),

                        // Divider with "Or continue with"
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03,
                                ),
                                child: Text(
                                  'Or continue with',
                                  style: GoogleFonts.acme(
                                    color: Colors.grey[800],
                                    fontSize: orContinueTextSize,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),

                        // Google and Apple Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Google Button
                            GestureDetector(
                              child: SquareTile(
                                imagePath: 'assets/images/google.png',
                              ),
                              onTap: () {
                                print("Google Button");
                              },
                            ),
                            SizedBox(width: screenWidth * 0.05),

                            // Apple Button
                            GestureDetector(
                              child: SquareTile(
                                imagePath: 'assets/images/apple.png',
                              ),
                              onTap: () {
                                print("Apple Button");
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),

                        // Already have an account? Login Now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account?',
                              style: GoogleFonts.acme(
                                color: Colors.grey[800],
                                fontSize: loginTextSize,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            GestureDetector(
                              child: Text(
                                'Login Now',
                                style: GoogleFonts.acme(
                                  color: const Color.fromARGB(255, 211, 44, 44),
                                  fontWeight: FontWeight.bold,
                                  fontSize: loginTextSize,
                                ),
                              ),
                              onTap: () {
                                Get.to(LoginView());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
