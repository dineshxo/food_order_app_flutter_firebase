import 'package:flutter/material.dart';
import 'package:food_order/constants/style.dart';

class AuthMainTopContainer extends StatelessWidget {
  const AuthMainTopContainer({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight / 2.1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: mainYellow,
      ),
      width: double.infinity,
      child: Stack(children: [
        Image.asset(
          'images/foodlineart.png',
          height: screenHeight / 2,
        ),
        Center(
          child: Image.asset(
            'images/main.png',
            height: screenHeight / 2.3,
          ),
        ),
      ]),
    );
  }
}
