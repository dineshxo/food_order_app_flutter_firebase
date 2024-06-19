import 'package:flutter/material.dart';
import 'package:food_order/components/receipt.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Delivery in progress"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Receipt(),
        ],
      ),
    );
  }
}
