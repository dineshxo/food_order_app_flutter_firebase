import 'package:flutter/material.dart';
import 'package:food_order/components/cart_tile.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:food_order/pages/payment_page.dart';
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
        final totalPrice = restaurant.getTotalPrice();
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: const Text("Cart"),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                    color: Colors.redAccent, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      _clearCartDialog(context, restaurant);
                    },
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: userCart.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cart is empty.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "Add items to cart.",
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = userCart[index];
                          return CartTile(cartItem: cartItem);
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Total: \$${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Opacity(
                      opacity: userCart.isEmpty ? 0.5 : 1,
                      child: MainButton(
                        onTap: () {
                          if (userCart.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentPage(
                                          total: totalPrice,
                                        )));
                          }
                        },
                        text: "Checkout",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _clearCartDialog(
      BuildContext context, Restaurant restaurant) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Are you sure you want to clear the cart?",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              restaurant.clearCart();
              Navigator.pop(context);
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
