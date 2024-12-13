import 'package:flutter/material.dart';

class Chosetypscreen extends StatefulWidget {
  const Chosetypscreen({super.key});

  @override
  State<Chosetypscreen> createState() => _ChosetypscreenState();
}

class _ChosetypscreenState extends State<Chosetypscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              color: const Color.fromARGB(255, 117, 13, 13),
              textColor: Colors.white,
              onPressed: () {},
              child: const Text(
                " Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
          MaterialButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text(" Men"),
          ),
          MaterialButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text(" Women"),
          ),
          MaterialButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text(" Kids"),
          )
        ],
      ),
    );
  }
}
