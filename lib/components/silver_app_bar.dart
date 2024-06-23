import 'package:flutter/material.dart';
import 'package:food_order/pages/cart_page.dart';

class SilAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const SilAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.lime.shade400, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black87,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.lime.shade400, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black87,
                    )),
              ),
            ],
          ),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunset Dinner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
