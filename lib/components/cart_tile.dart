import 'package:flutter/material.dart';
import 'package:food_order/models/cart_item.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(cartItem.food.name),
                          Text('\$${cartItem.food.price.toString()}'),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
