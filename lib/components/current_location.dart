import 'package:flutter/material.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  CurrentLocation({super.key});

  final TextEditingController addressController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Your Location",
          style: TextStyle(fontSize: 18),
        ),
        content: TextField(
          controller: addressController,
          decoration: const InputDecoration(
              hintText: "Enter Address", hintStyle: TextStyle(fontSize: 15)),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              String newAddress = addressController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              'images/avatar.jpg',
              height: 45,
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deliver now,",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: () => openLocationSearchBox(context),
                child: Row(
                  children: [
                    Consumer<Restaurant>(builder: (context, restaurant, child) {
                      String displayAddress = restaurant.deliveryAddress.isEmpty
                          ? "Your location"
                          : restaurant.deliveryAddress;
                      return Text(
                        displayAddress,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      );
                    }),
                    const Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
