import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.white,
        title: const Text(
          'My Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/products/me.png', // Sample profile image
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Abdirahman Afrah',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Afrah67@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(context, 'My orders', 'Already have 12 orders'),
            _buildProfileOption(context, 'Shipping addresses', '3 addresses'),
            _buildProfileOption(context, 'Payment methods', 'Visa **34'),
            _buildProfileOption(
                context, 'Promocodes', 'You have special promocodes'),
            _buildProfileOption(context, 'My reviews', 'Reviews for 4 items'),
            _buildProfileOption(context, 'Settings', 'Notifications, password'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
      BuildContext context, String title, String subtitle) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Action when the list item is tapped
      },
    );
  }
}
