import 'package:flutter/material.dart';
import 'package:riverpod_files/screens/sucessScreen.dart';

class ShopknowScreen extends StatefulWidget {
  const ShopknowScreen({super.key});

  @override
  State<ShopknowScreen> createState() => _ShopknowScreenState();
}

class _ShopknowScreenState extends State<ShopknowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Bag"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping address
            const Text(
              'Shipping address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Jane Doe\n3 Newbridge Court\nChino Hills, CA 91709, United States',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Change',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 43),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method
            const Text(
              'Payment',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '**** **** **** 3947\nMastercard',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Change',
                    style: TextStyle(
                        color: Color.fromARGB(255, 243, 33, 33),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Delivery Method
            const Text(
              'Delivery method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                deliveryMethodItem('FedEx', '2-3 days'),
                deliveryMethodItem('USPS', '2-3 days'),
                deliveryMethodItem('DHL', '2-3 days'),
              ],
            ),
            const SizedBox(height: 20),

            // Order Summary
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            orderSummary('Order:', '112\$'),
            orderSummary('Delivery:', '15\$'),
            orderSummary('Summary:', '127\$'),

            const SizedBox(height: 30),

            // Submit Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SucessScreen()),
                  );
                },
                child: Text(
                  'SUBMIT ORDER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Delivery Method Items
  Widget deliveryMethodItem(String method, String time) {
    return Column(
      children: [
        Image.asset(
          'assets/products/dl.png', // You can add the corresponding icon for each method here
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 5),
        Text(method, style: const TextStyle(fontSize: 14)),
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  // Reusable Widget for Order Summary items
  Widget orderSummary(String label, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(amount,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
