import 'package:flutter/material.dart';

class Chosetypscreen extends StatefulWidget {
  final Function(String) onMenuSelected;

  const Chosetypscreen({super.key, required this.onMenuSelected});

  @override
  State<Chosetypscreen> createState() => _ChosetypscreenState();
}

class _ChosetypscreenState extends State<Chosetypscreen> {
  String selectedButton = "Home"; // Default selected button

  void selectButton(String buttonName) {
    setState(() {
      selectedButton = buttonName; // Update the selected button
    });
    widget.onMenuSelected(buttonName); // Notify parent about the selection
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            color: selectedButton == "Home"
                ? Color.fromARGB(255, 91, 2, 17) // Selected button color
                : Colors.white, // Default color
            textColor: selectedButton == "Home" ? Colors.white : Colors.black,
            onPressed: () => selectButton("Home"),
            child: const Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: selectedButton == "Men"
                ? Color.fromARGB(255, 91, 2, 17)
                : Colors.white,
            textColor: selectedButton == "Men" ? Colors.white : Colors.black,
            onPressed: () => selectButton("Men"),
            child: const Text("Men"),
          ),
          MaterialButton(
            color: selectedButton == "Women"
                ? Color.fromARGB(255, 91, 2, 17)
                : Colors.white,
            textColor: selectedButton == "Women" ? Colors.white : Colors.black,
            onPressed: () => selectButton("Women"),
            child: const Text("Women"),
          ),
          MaterialButton(
            color: selectedButton == "Kids"
                ? Color.fromARGB(255, 91, 2, 17)
                : Colors.white,
            textColor: selectedButton == "Kids" ? Colors.white : Colors.black,
            onPressed: () => selectButton("Kids"),
            child: const Text("Kids"),
          ),
        ],
      ),
    );
  }
}
