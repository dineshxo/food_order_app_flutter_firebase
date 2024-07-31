import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/components/receipt.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:food_order/pages/home_page.dart';
import 'package:food_order/services/auth/auth_check.dart';
import 'package:food_order/services/database/order_services.dart';
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
    final double containerHeight = deviceHeight / 2;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: containerHeight,
                    child: Column(
                      children: [
                        Image.asset('images/delivery.png'),
                        const Text(
                          "Thank You for Your Order !",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.green),
                        ),
                        const Text(
                          "Order will delivered within 30 minutes",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showReceipt(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "View Receipt",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.limeAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Transform.rotate(
                            angle: -90 * 3.141592653589793238 / 180,
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showReceipt(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return Receipt();
      },
    );
  }
}





 // SizedBox(
            //   height: containerHeight,
            //   child: const SingleChildScrollView(
            //     child: Receipt(),
            //   ),
            // ),