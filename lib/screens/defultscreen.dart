import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';

class DefualtScreen extends ConsumerWidget {
  const DefualtScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Padding(
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
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 111, 2, 28).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Image.asset(allProducts[index].image,
                      width: 130, height: 130),
                  Text(allProducts[index].title),
                  Text(
                    '\$${allProducts[index].price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(allProducts[index]);
                      },
                      child: const Text(
                        'Remove',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
                              color: Color.fromARGB(255, 18, 76, 5),
                              fontWeight: FontWeight.bold)),
                    ),
                ]));
          },
        ));
  }
}
