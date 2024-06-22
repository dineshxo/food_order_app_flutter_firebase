import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/constants/style.dart';
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
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, bottom: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.food.name,
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${widget.food.price.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: priceGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.food.description),
                    Divider(
                      color: mainYellow,
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
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddOns.length,
                        itemBuilder: (context, index) {
                          AddOn addOn = widget.food.availableAddOns[index];
                          return CheckboxListTile(
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.white;
                              },
                            ),
                            title: Text(
                              addOn.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '\$${addOn.price.toString()}',
                              style: TextStyle(
                                  color: priceGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
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
          opacity: 0.9,
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
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
