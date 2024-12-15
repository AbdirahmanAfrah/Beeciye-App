import 'package:flutter/material.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';
import 'package:riverpod_files/screens/home/home_screen.dart';
import 'package:riverpod_files/screens/profile/profilescreen.dart';

class ButtonNavScreen extends StatefulWidget {
  const ButtonNavScreen({super.key});

  @override
  State<ButtonNavScreen> createState() => _ButtonNavScreenState();
}

class _ButtonNavScreenState extends State<ButtonNavScreen> {
  // ignore: prefer_final_fields

  int SelectIndex = 0;

  void onTap(int index) {
    setState(() {
      SelectIndex = index;
    });
  }

  List<Widget> _screens = [
    const Homescreen(),
    const CartScreen(),
    MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[SelectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Shop'),
          // BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Bag'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
