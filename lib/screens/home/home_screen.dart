import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/Widgets/choosetype.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

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
                  color: Color.fromARGB(255, 113, 37, 27),
                  borderRadius: BorderRadius.circular(20)),
              // Example color for the banner
              height: 150, // Set a fixed height for the banner
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/products/sale.png",
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    "assets/products/leg.png",
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    "assets/products/dis.png",
                    width: 70,
                    height: 70,
                  ),
                  Image.asset(
                    "assets/products/top5.png",
                    width: 100,
                    height: 100,
                  ),

                  // Text(
                  //   'Stay home we deliver\nAnywhere... Anytime!',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(width: 20),
                  // Icon(Icons.local_shipping, size: 50),
                ],
              ),
            ),
          ),
          Chosetypscreen(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                itemCount: allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.blueGrey.withOpacity(0.05),
                      child: Column(children: [
                        Image.asset(allProducts[index].image,
                            width: 130, height: 130),
                        Text(allProducts[index].title),
                        Text('\$${allProducts[index].price}'),
                        if (cartProducts.contains(allProducts[index]))
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .removeProduct(allProducts[index]);
                            },
                            child: const Text(
                              'Remove',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        if (!cartProducts.contains(allProducts[index]))
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .addProduct(allProducts[index]);
                            },
                            child: const Text('Add Cart',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 18, 76, 5))),
                          ),
                      ]));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
