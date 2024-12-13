import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/screens/productDeatil/ProductDeatilScreen.dart';

class KidsCarScreen extends ConsumerWidget {
  const KidsCarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kidsProducts = ref.watch(kidsProductsProvider); // Kids products
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: kidsProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to ProductDetailsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      product: kidsProducts[index], // Pass product data
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 102, 11, 11).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      kidsProducts[index].image,
                      width: 130,
                      height: 130,
                    ),
                    Text(kidsProducts[index].title),
                    Text('\$${kidsProducts[index].price}'),
                    if (cartProducts.contains(kidsProducts[index]))
                      TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(kidsProducts[index]);
                        },
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    if (!cartProducts.contains(kidsProducts[index]))
                      TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(kidsProducts[index]);
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
