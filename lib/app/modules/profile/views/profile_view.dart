import 'package:ecommerce/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Emma Phillips',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Fashion Model',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _buildInfoRow(Icons.phone, '(581)-307-6902'),
              _buildInfoRow(Icons.email, 'emma.phillips@gmail.com'),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatColumn('\$140.00', 'Wallet'),
                    _buildStatColumn('12', 'Orders'),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Divider(),
              buildMenuItem(Icons.favorite_border, 'Your Favorites'),
              buildMenuItem(Icons.payment, 'Payment'),
              buildMenuItem(Icons.person_add, 'Tell Your Friend'),
              buildMenuItem(Icons.local_offer, 'Promotions'),
              buildMenuItem(Icons.settings, 'Settings'),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                onTap: () {
                  Get.to(LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build info rows
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        SizedBox(width: 5),
        Text(text, style: TextStyle(color: Colors.grey, fontSize: 16)),
      ],
    );
  }

  // Helper function to build the stats columns
  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  // Function to build menu items
  Widget buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}
