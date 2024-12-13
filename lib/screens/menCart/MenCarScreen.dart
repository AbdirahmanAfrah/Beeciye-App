import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/screens/productDeatil/ProductDeatilScreen.dart';

class MenCarScreen extends ConsumerWidget {
  const MenCarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shirtProducts = ref.watch(menShirtsProductsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: shirtProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to ProductDetailsScreen when a product is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      product: shirtProducts[index], // Pass the product data
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 111, 2, 28).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      shirtProducts[index].image,
                      width: 130,
                      height: 130,
                    ),
                    Text(shirtProducts[index].title),
                    Text('\$${shirtProducts[index].price}'),
                    if (cartProducts.contains(shirtProducts[index]))
                      TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(shirtProducts[index]);
                        },
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    if (!cartProducts.contains(shirtProducts[index]))
                      TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(shirtProducts[index]);
                        },
                        child: const Text(
                          'Add Cart',
                          style:
                              TextStyle(color: Color.fromARGB(255, 18, 76, 5)),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
