import 'package:flutter/material.dart';
import 'package:food_order/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            widget.food.imagePath,
            width: double.infinity,
            height: 400,
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
                        value: false,
                        onChanged: (value) {},
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
