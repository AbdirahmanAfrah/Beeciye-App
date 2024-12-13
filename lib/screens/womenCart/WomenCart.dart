import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart'; // Import your products provider

class WomenCarScreen extends ConsumerWidget {
  const WomenCarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topProducts = ref.watch(womenTopsProductsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    // Debug print to check the data
    // print('Men Shirts Products: ${shirtProducts.length}');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: topProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 111, 2, 28).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Image.asset(
                    topProducts[index].image,
                    width: 130,
                    height: 130,
                  ),
                  Text(topProducts[index].title),
                  Text('\$${topProducts[index].price}'),
                  if (cartProducts.contains(topProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(topProducts[index]);
                      },
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  if (!cartProducts.contains(topProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(topProducts[index]);
                      },
                      child: const Text(
                        'Add Cart',
                        style: TextStyle(color: Color.fromARGB(255, 18, 76, 5)),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
