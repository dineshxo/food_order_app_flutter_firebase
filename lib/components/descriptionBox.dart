import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var PrimaryTextStye = TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.bold,
        fontSize: 18);
    var SecondaryTextStye = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "\$0.99",
                style: PrimaryTextStye,
              ),
              Text(
                'Delivery Fee',
                style: SecondaryTextStye,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "15-30 min",
                style: PrimaryTextStye,
              ),
              Text(
                'Delivery Time',
                style: SecondaryTextStye,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
