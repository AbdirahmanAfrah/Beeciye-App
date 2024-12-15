import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_files/screens/BottonNav/buttonNavScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to ButtonNavScreen after 3 minutes (180 seconds)
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ButtonNavScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/products/beeciye.png"),
          const Text(
            "Beeciye Sale",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
