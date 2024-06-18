import 'package:flutter/material.dart';
import 'package:food_order/models/food.dart';

class MainTabBar extends StatelessWidget {
  final TabController tabController;
  const MainTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: _buildCategoryTabs(),
      controller: tabController,
    );
  }
}
