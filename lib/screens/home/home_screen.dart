import 'package:flutter/material.dart';
import 'package:riverpod_files/Widgets/choosetype.dart';
import 'package:riverpod_files/screens/defultscreen.dart';
import 'package:riverpod_files/screens/kidsCart/kidsCartScreen.dart';
import 'package:riverpod_files/screens/menCart/MenCarScreen.dart';
import 'package:riverpod_files/screens/womenCart/WomenCart.dart';
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
    } else if (activeScreen == 'Women') {
      currentScreen = const WomenCarScreen();
    } else if (activeScreen == 'Kids') {
      currentScreen = const KidsCarScreen();
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
                color: Color.fromARGB(255, 255, 158, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/products/sale.png",
                      width: 100, height: 100),
                  Image.asset("assets/products/dis.png",
                      width: 100, height: 100),
                  Image.asset("assets/products/bag.png",
                      width: 150, height: 150),

                  // Image.asset("assets/products/top5.png",
                  //     width: 100, height: 100),
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
