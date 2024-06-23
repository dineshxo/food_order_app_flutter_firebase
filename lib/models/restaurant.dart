import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/cart_item.dart';
import 'package:food_order/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: 'Classic Burger',
      description: 'A classic beef burger with lettuce, tomato, and cheese.',
      imagePath: 'images/burger.png',
      price: 8.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'BBQ Burger',
      description: 'Beef burger with BBQ sauce, bacon, and cheddar cheese.',
      imagePath: 'images/burger.png',
      price: 10.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Veggie Burger',
      description:
          'A delicious veggie patty with lettuce, tomato, and avocado.',
      imagePath: 'images/burger.png',
      price: 9.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Spicy Chicken Burger',
      description: 'Crispy chicken with spicy sauce, lettuce, and tomato.',
      imagePath: 'images/burger.png',
      price: 9.49,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Double Cheeseburger',
      description: 'Two beef patties with double cheese, lettuce, and tomato.',
      imagePath: 'images/burger.png',
      price: 11.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Caesar Salad',
      description:
          'Fresh romaine lettuce with Caesar dressing, croutons, and parmesan cheese.',
      imagePath: 'images/burger.png',
      price: 7.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Greek Salad',
      description: 'A mix of cucumbers, tomatoes, olives, and feta cheese.',
      imagePath: 'images/burger.png',
      price: 8.49,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Cobb Salad',
      description:
          'Romaine lettuce, chicken, bacon, avocado, egg, and blue cheese.',
      imagePath: 'images/burger.png',
      price: 10.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Spinach Salad',
      description:
          'Fresh spinach with strawberries, almonds, and balsamic vinaigrette.',
      imagePath: 'images/burger.png',
      price: 8.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Quinoa Salad',
      description: 'Quinoa with black beans, corn, and cilantro lime dressing.',
      imagePath: 'images/burger.png',
      price: 9.49,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'French Fries',
      description: 'Crispy golden French fries.',
      imagePath: 'images/burger.png',
      price: 2.99,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Onion Rings',
      description: 'Crispy battered onion rings.',
      imagePath: 'images/burger.png',
      price: 3.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Sweet Potato Fries',
      description: 'Sweet potato fries with a hint of cinnamon.',
      imagePath: 'images/burger.png',
      price: 3.99,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Toasted garlic bread with a side of marinara sauce.',
      imagePath: 'images/burger.png',
      price: 4.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Coleslaw',
      description: 'Freshly made coleslaw with a tangy dressing.',
      imagePath: 'images/burger.png',
      price: 2.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Chocolate Cake',
      description: 'Rich and moist chocolate cake.',
      imagePath: 'images/burger.png',
      price: 5.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Cheesecake',
      description: 'Classic New York style cheesecake.',
      imagePath: 'images/burger.png',
      price: 6.49,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Ice Cream Sundae',
      description:
          'Vanilla ice cream with chocolate sauce, whipped cream, and a cherry on top.',
      imagePath: 'images/burger.png',
      price: 4.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Apple Pie',
      description: 'Warm apple pie with a flaky crust.',
      imagePath: 'images/burger.png',
      price: 5.49,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Brownie',
      description: 'Chewy chocolate brownie with nuts.',
      imagePath: 'images/burger.png',
      price: 3.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Cola',
      description: 'Classic cola beverage.',
      imagePath: 'images/burger.png',
      price: 1.99,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Lemonade',
      description: 'Refreshing lemonade made from fresh lemons.',
      imagePath: 'images/burger.png',
      price: 2.49,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Iced Tea',
      description: 'Chilled iced tea with a hint of lemon.',
      imagePath: 'images/burger.png',
      price: 1.99,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Coffee',
      description: 'Hot brewed coffee.',
      imagePath: 'images/burger.png',
      price: 1.49,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Milkshake',
      description:
          'Creamy milkshake available in chocolate, vanilla, or strawberry.',
      imagePath: 'images/burger.png',
      price: 3.99,
      category: FoodCategory.drinks,
    ),
  ];

  final List<CartItem> _cart = [];
  String _deliveryAddress = '';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  void addToCart(Food food) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) => item.food == food);

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      total += cartItem.food.price * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln("---------------------------------------");
    receipt.writeln();

    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    receipt.writeln(formattedDate);

    receipt.writeln();
    receipt.writeln("---------------------------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      receipt.writeln();
    }

    receipt.writeln("---------------------------------------");
    receipt.writeln();
    receipt.writeln('Total Items: ${getTotalItemCount()}');
    receipt.writeln('Total price: ${_formatPrice(getTotalPrice())}');

    receipt.writeln("Deliver to: $deliveryAddress");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  List<Food> getFullMenu() {
    return _menu;
  }

  Map<FoodCategory, List<Food>> categorizeFoodItems() {
    Map<FoodCategory, List<Food>> categorizedFood = {};
    for (FoodCategory category in FoodCategory.values) {
      categorizedFood[category] =
          _menu.where((food) => food.category == category).toList();
    }
    return categorizedFood;
  }
}
