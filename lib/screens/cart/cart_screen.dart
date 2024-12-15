import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/screens/shopnow/shopNowScreen.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Column(
                children: cartProducts.map((product) {
                  return Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(children: [
                        Image.asset(product.image, width: 60, height: 60),
                        const SizedBox(width: 10),
                        Text('${product.title}...'),
                        const Expanded(child: SizedBox()),
                        Text('\$${product.price}'),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 108, 10, 20),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            child: Text(
                              "Shop Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 250, 251, 252)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopknowScreen()),
                              );
                            },
                          ),
                        )
                      ]));
                }).toList(),
              ),

              // output totals here
              //Text('Total price - \$$total'),
            ],
          ),
        ),
      ),
    );
  }
}
