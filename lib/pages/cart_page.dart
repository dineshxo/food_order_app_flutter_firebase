import 'package:flutter/material.dart';
import 'package:food_order/components/cart_tile.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: const Text("Cart"),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      final cartItem = userCart[index];
                      return CartTile(cartItem: cartItem);
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
