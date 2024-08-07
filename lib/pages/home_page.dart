import 'package:flutter/material.dart';
import 'package:food_order/components/current_location.dart';
import 'package:food_order/components/food_tile.dart';
import 'package:food_order/components/nav_bar_menu_button.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/models/restaurant.dart';
import 'package:food_order/pages/cart_page.dart';
import 'package:food_order/pages/food_page.dart';
import 'package:provider/provider.dart';
import '../components/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Food> _fullMenu;
  late Map<FoodCategory, List<Food>> _categorizedMenu = {};
  FoodCategory _selectedCategory = FoodCategory.burgers;
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _initializeMenu();
  }

  Future<void> _initializeMenu() async {
    final restaurant = Provider.of<Restaurant>(context, listen: false);
    await restaurant.initializeMenu();
    setState(() {
      _fullMenu = restaurant.getFullMenu();
      _categorizedMenu = restaurant.categorizeFoodItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: NavBarMenuButton(scaffoldKey: _scaffoldKey),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) {
                    int cartQuantity = restaurant.cart
                        .fold(0, (sum, item) => sum + item.quantity);
                    return Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.limeAccent, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartPage()),
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (cartQuantity > 0)
                          Positioned(
                            right: 0,
                            top: -6,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                cartQuantity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.limeAccent, shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.black87,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CurrentLocation(),
          searchBar(),
          categorySelector(),
          Expanded(child: foodList()),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 234, 234),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        controller: _searchController,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Color.fromARGB(255, 102, 102, 102),
          ),
          hintText: "Search for foods...",
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget categorySelector() {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FoodCategory.values.length,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          FoodCategory category = FoodCategory.values[index];
          bool isSelected = _selectedCategory == category;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.limeAccent
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _categoryName(category),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.black : Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget foodList() {
    List<Food> foods = _categorizedMenu[_selectedCategory] ?? [];
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return FoodTile(
          food: foods[index],
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodPage(food: foods[index]))),
        );
      },
    );
  }

  String _categoryName(FoodCategory category) {
    switch (category) {
      case FoodCategory.burgers:
        return "Burgers.";
      case FoodCategory.salads:
        return "Salads.";
      case FoodCategory.sides:
        return "Sides.";
      case FoodCategory.desserts:
        return "Desserts.";
      case FoodCategory.drinks:
        return "Drinks.";
      default:
        return "Other.";
    }
  }
}
