import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOns = {};

  FoodPage({super.key, required this.food}) {
    for (AddOn addOn in food.availableAddOns) {
      selectedAddOns[addOn] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<AddOn, bool> selectedAddOns) {
    Navigator.pop(context);

    List<AddOn> currentSelectedAddOns = [];

    for (AddOn addOn in widget.food.availableAddOns) {
      if (widget.selectedAddOns[addOn] == true) {
        currentSelectedAddOns.add(addOn);
      }
    }
    context.read<Restaurant>().addToCart(food, currentSelectedAddOns);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                widget.food.imagePath,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${widget.food.price.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(widget.food.description),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Add-ons",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddOns.length,
                        itemBuilder: (context, index) {
                          AddOn addOn = widget.food.availableAddOns[index];
                          return CheckboxListTile(
                            title: Text(addOn.name),
                            subtitle: Text('\$${addOn.price.toString()}'),
                            value: widget.selectedAddOns[addOn],
                            onChanged: (value) {
                              setState(() {
                                widget.selectedAddOns[addOn] = value!;
                              });
                            },
                          );
                        }),
                    MainButton(
                        onTap: () =>
                            addToCart(widget.food, widget.selectedAddOns),
                        text: "Add to cart")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SafeArea(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
      )
    ]);
  }
}
