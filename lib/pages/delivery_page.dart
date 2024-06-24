import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/components/receipt.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:food_order/pages/home_page.dart';
import 'package:food_order/services/auth/auth_check.dart';
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

  void _clearCartAndNavigateHome(BuildContext context) {
    context.read<Restaurant>().clearCart();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double containerHeight = deviceHeight / 2.6;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('images/delivery.png'),
            const Text(
              "Thank You for Your Order.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),
            ),
            const Text(
              "Order will delivered within 30 minutes",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(
              height: containerHeight,
              child: const SingleChildScrollView(
                child: Receipt(),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.limeAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MainButton(
                onTap: () {
                  _clearCartAndNavigateHome(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthCheck()));
                },
                text: "Home",
              ),
            )
          ],
        ),
      ),
    );
  }
}
