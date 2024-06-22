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
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 3, 0, 0).withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${cartItem.food.price.toString()}',
                                  style: TextStyle(
                                      color: priceGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              const SizedBox(
                                width: 15,
                              ),
                              QuantitySelector(
                                quantity: cartItem.quantity,
                                food: cartItem.food,
                                onIncrement: () {
                                  restaurant.addToCart(
                                      cartItem.food, cartItem.selectedAddOns);
                                },
                                onDecrement: () {
                                  restaurant.removeFromCart(cartItem);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: cartItem.selectedAddOns.isEmpty ? 0 : 60,
                    child: ListView(
                        padding: const EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        children: cartItem.selectedAddOns
                            .map((addOn) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: FilterChip(
                                      label: Row(
                                        children: [
                                          Text(
                                            addOn.name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '\$${addOn.price.toString()}',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          )
                                        ],
                                      ),
                                      shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary)),
                                      onSelected: (value) {}),
                                ))
                            .toList()),
                  )
                ],
              ),
            ));
  }
}
