import 'package:flutter/material.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<Restaurant>(
            builder: (context, restaurant, child) =>
                Text(restaurant.displayCartReceipt()),
          ),
        )
      ],
    );
  }
}
