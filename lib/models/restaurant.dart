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
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%202.jpg?alt=media&token=25c6b0a0-7b5a-464a-ac16-afe9463e7f85',
      price: 8.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'BBQ Burger',
      description: 'Beef burger with BBQ sauce, bacon, and cheddar cheese.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger.png?alt=media&token=436d876f-c0f1-4f80-9aed-5395386e74dc',
      price: 10.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Veggie Burger',
      description:
          'A delicious veggie patty with lettuce, tomato, and avocado.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%203.jpg?alt=media&token=4213437b-9227-4b6c-a118-eeea56f12e3f',
      price: 9.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Spicy Chicken Burger',
      description: 'Crispy chicken with spicy sauce, lettuce, and tomato.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%204.jpg?alt=media&token=2c1b6370-f23c-4ac2-9bf2-d57c64ea64b9',
      price: 9.49,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Double Cheeseburger',
      description: 'Two beef patties with double cheese, lettuce, and tomato.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%205.jpg?alt=media&token=65d86b2f-6b91-4b05-8d42-b93db8155669',
      price: 11.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Caesar Salad',
      description:
          'Fresh romaine lettuce with Caesar dressing, croutons, and parmesan cheese.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%201.jpg?alt=media&token=5cb7c8b9-1985-479f-82d5-01b2c54371d2',
      price: 7.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Greek Salad',
      description: 'A mix of cucumbers, tomatoes, olives, and feta cheese.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%202.jpg?alt=media&token=8a435a7e-7764-4a89-8e4a-0009b0c41eea',
      price: 8.49,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Cobb Salad',
      description:
          'Romaine lettuce, chicken, bacon, avocado, egg, and blue cheese.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%203.jpg?alt=media&token=e99610ff-7664-47a9-835a-db420ac1456b',
      price: 10.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Spinach Salad',
      description:
          'Fresh spinach with strawberries, almonds, and balsamic vinaigrette.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%204.jpg?alt=media&token=3124f706-28b0-43c3-b89c-06208e3a675b',
      price: 8.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'Quinoa Salad',
      description: 'Quinoa with black beans, corn, and cilantro lime dressing.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%205.jpg?alt=media&token=6ac8a6b3-050d-4990-bf3c-a0e854d48542',
      price: 9.49,
      category: FoodCategory.salads,
    ),
    Food(
      name: 'French Fries',
      description: 'Crispy golden French fries.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%201.jpg?alt=media&token=8b960f88-674a-45a3-9f40-06cc7bc593d6',
      price: 2.99,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Onion Rings',
      description: 'Crispy battered onion rings.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%202.jpg?alt=media&token=437a974d-cc5f-418d-becb-7094412c228f',
      price: 3.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Sweet Potato Fries',
      description: 'Sweet potato fries with a hint of cinnamon.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%203.jpg?alt=media&token=a879ff17-ed39-447c-9ff8-75d91c432010',
      price: 3.99,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Toasted garlic bread with a side of marinara sauce.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%204.jpg?alt=media&token=902c274a-0f19-4471-8f13-497c2bda7e16',
      price: 4.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Coleslaw',
      description: 'Freshly made coleslaw with a tangy dressing.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%205.jpg?alt=media&token=62e300ad-f2ba-426b-a10d-c3eda2d0b177',
      price: 2.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: 'Chocolate Cake',
      description: 'Rich and moist chocolate cake.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%201.jpg?alt=media&token=6299aeb2-4bde-43f2-857e-6e34cf49c9e6',
      price: 5.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Cheesecake',
      description: 'Classic New York style cheesecake.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%202.jpg?alt=media&token=26ec12b1-0431-4bf1-80ac-9e6b8358ace3',
      price: 6.49,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Ice Cream Sundae',
      description:
          'Vanilla ice cream with chocolate sauce, whipped cream, and a cherry on top.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%203.jpg?alt=media&token=b2327ac5-0342-4eeb-b8df-99d6079e2cdc',
      price: 4.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Apple Pie',
      description: 'Warm apple pie with a flaky crust.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%204.jpg?alt=media&token=5892ce64-051b-478b-abce-ce1de2874326',
      price: 5.49,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Brownie',
      description: 'Chewy chocolate brownie with nuts.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%205.jpg?alt=media&token=3e96ee28-13ff-4de3-9f08-9f8b004dc2b6',
      price: 3.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: 'Cola',
      description: 'Classic cola beverage.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%201.jpg?alt=media&token=ff877f4d-51d1-441c-b87f-8eed24b071cf',
      price: 1.99,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Lemonade',
      description: 'Refreshing lemonade made from fresh lemons.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%202.jpg?alt=media&token=1a370776-9c96-4000-a270-f0badc234704',
      price: 2.49,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Iced Tea',
      description: 'Chilled iced tea with a hint of lemon.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%203.jpg?alt=media&token=a6dfcceb-f454-4130-9cf9-f71ea424e49f',
      price: 1.99,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Coffee',
      description: 'Hot brewed coffee.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%204.jpg?alt=media&token=a4976bcc-d81d-490b-831f-b6dbc470b9e9',
      price: 1.49,
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'Milkshake',
      description:
          'Creamy milkshake available in chocolate, vanilla, or strawberry.',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%205.jpg?alt=media&token=71ab9dcf-78f4-4e7f-931b-2947ce1a0f7e',
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
