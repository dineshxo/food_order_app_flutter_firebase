import 'package:flutter/material.dart';
import 'package:food_order/components/current_location.dart';
import 'package:food_order/components/descriptionBox.dart';
import 'package:food_order/components/food_tile.dart';
import 'package:food_order/components/silver_appBar.dart';
import 'package:food_order/components/tabBar.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:food_order/pages/food_page.dart';
import 'package:provider/provider.dart';

import '../components/appDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const appDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SilAppBar(
                    title: MainTabBar(tabController: _tabController),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        CurrentLocation(),
                        DescriptionBox(),
                      ],
                    )),
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              children: getFoodInThisCategory(
                restaurant.menu,
              ),
              controller: _tabController,
            ),
          )),
    );
  }
}
