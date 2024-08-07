import 'package:flutter/material.dart';
import 'package:food_order/components/quantity_selector.dart';
import 'package:food_order/constants/style.dart';
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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    cartItem.food.imagePath,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${cartItem.food.price.toString()}',
                            style: TextStyle(
                              color: priceGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 30),
                          QuantitySelector(
                            quantity: cartItem.quantity,
                            food: cartItem.food,
                            onIncrement: () {
                              restaurant.addToCart(cartItem.food);
                            },
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: mainYellow,
            ),
          ],
        ),
      ),
    );
  }
}
