import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/cart_item.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/services/database/food_services.dart';

import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  List<Food> _menu = [];
  final List<CartItem> _cart = [];
  String _deliveryAddress = '';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  Future<void> fetchAndStoreFoodMenu() async {
    final FoodService foodService = FoodService();
    List<Food> fetchedMenu = await foodService.fetchFoodMenu();
    _menu = fetchedMenu;
    notifyListeners();
  }

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
    receipt.writeln(
      "Here's your receipt",
    );
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

  Future<void> initializeMenu() async {
    await fetchAndStoreFoodMenu();
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
