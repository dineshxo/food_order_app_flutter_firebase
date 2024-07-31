import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double containerHeight = deviceHeight / 2;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: containerHeight,
              child: SingleChildScrollView(
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.displayCartReceipt()),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: MainButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Back",
          ),
        ),
      ],
    );
  }
}
