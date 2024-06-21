import 'package:flutter/material.dart';
import 'package:food_order/components/receipt.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:food_order/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

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
