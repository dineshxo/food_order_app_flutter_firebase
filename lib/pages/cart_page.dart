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
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: const Text("Cart"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          "Are you sure you want to clear the cart?"),
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
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: userCart.isEmpty
                    ? const Center(
                        child: Text("Cart is empty. Add items to cart."),
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
                padding:
                    const EdgeInsets.all(20.0), // Add padding to MainButton
                child: Opacity(
                  opacity: userCart.isEmpty ? 0.5 : 1,
                  child: MainButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()));
                    },
                    text: "Checkout",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
