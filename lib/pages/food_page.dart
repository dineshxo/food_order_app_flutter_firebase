import 'package:flutter/material.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/components/quantity_selector.dart';
import 'package:food_order/constants/style.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food) {
    Navigator.pop(context);
    context.read<Restaurant>().addToCart(food);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.network(
                  widget.food.imagePath,
                  width: double.infinity,
                  height: screenHeight / 1.9,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  bottom: 25,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.food.name,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(widget.food.description),
                          Divider(color: mainYellow),
                          Text(
                            '\$${widget.food.price.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: priceGreen,
                            ),
                          ),
                          const Row(
                            children: [
                              RatingBarFood(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MainButton(
                  onTap: () => addToCart(widget.food),
                  text: "Add to cart",
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
      ],
    );
  }
}

class RatingBarFood extends StatelessWidget {
  const RatingBarFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 25,
      initialRating: 4.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
