import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const MainButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16),
        )),
      ),
    );
  }
}
