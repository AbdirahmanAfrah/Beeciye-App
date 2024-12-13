import 'package:flutter/material.dart';
import 'package:riverpod_files/Widgets/choosetype.dart';
import 'package:riverpod_files/screens/defultscreen.dart';
import 'package:riverpod_files/screens/menCart/MenCarScreen.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String activeScreen = "Home";

  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    if (activeScreen == 'Home') {
      currentScreen = const DefualtScreen();
    } else if (activeScreen == 'Men') {
      currentScreen = const MenCarScreen();
    } else {
      currentScreen = const Text("Screen not found!");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beeciye Sales'),
        actions: const [CartIcon()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 113, 37, 27),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/products/sale.png",
                      width: 100, height: 100),
                  Image.asset("assets/products/leg.png",
                      width: 100, height: 100),
                  Image.asset("assets/products/dis.png", width: 70, height: 70),
                  Image.asset("assets/products/top5.png",
                      width: 100, height: 100),
                ],
              ),
            ),
          ),
          Chosetypscreen(
            onMenuSelected: switchScreen,
          ),
          Expanded(child: currentScreen),
        ],
      ),
    );
  }
}
