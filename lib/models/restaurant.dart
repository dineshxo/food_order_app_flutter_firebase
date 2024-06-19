import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/cart_item.dart';
import 'package:food_order/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
        name: 'Classic Burger',
        description: 'A classic beef burger with lettuce, tomato, and cheese.',
        imagePath: 'images/burger.png',
        price: 8.99,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: 'Extra Cheese', price: 1.00),
          AddOn(name: 'Bacon', price: 1.50),
          AddOn(name: 'Avocado', price: 2.00)
        ]),
    Food(
        name: 'BBQ Burger',
        description: 'Beef burger with BBQ sauce, bacon, and cheddar cheese.',
        imagePath: 'images/burger.png',
        price: 10.99,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: 'Grilled Onions', price: 0.99),
          AddOn(name: 'Extra Cheese', price: 1.00)
        ]),
    Food(
        name: 'Veggie Burger',
        description:
            'A delicious veggie patty with lettuce, tomato, and avocado.',
        imagePath: 'images/burger.png',
        price: 9.99,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: 'Extra Cheese', price: 1.00),
          AddOn(name: 'Avocado', price: 2.00)
        ]),
    Food(
        name: 'Spicy Chicken Burger',
        description: 'Crispy chicken with spicy sauce, lettuce, and tomato.',
        imagePath: 'images/burger.png',
        price: 9.49,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: 'Jalapenos', price: 0.75),
          AddOn(name: 'Extra Cheese', price: 1.00)
        ]),
    Food(
        name: 'Double Cheeseburger',
        description:
            'Two beef patties with double cheese, lettuce, and tomato.',
        imagePath: 'images/burger.png',
        price: 11.99,
        category: FoodCategory.burgers,
        availableAddOns: [
          AddOn(name: 'Extra Cheese', price: 1.00),
          AddOn(name: 'Bacon', price: 1.50)
        ]),
    Food(
        name: 'Caesar Salad',
        description:
            'Fresh romaine lettuce with Caesar dressing, croutons, and parmesan cheese.',
        imagePath: 'images/burger.png',
        price: 7.99,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: 'Grilled Chicken', price: 2.50),
          AddOn(name: 'Extra Parmesan', price: 1.00)
        ]),
    Food(
        name: 'Greek Salad',
        description: 'A mix of cucumbers, tomatoes, olives, and feta cheese.',
        imagePath: 'images/burger.png',
        price: 8.49,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: 'Extra Feta', price: 1.50),
          AddOn(name: 'Olives', price: 1.00)
        ]),
    Food(
        name: 'Cobb Salad',
        description:
            'Romaine lettuce, chicken, bacon, avocado, egg, and blue cheese.',
        imagePath: 'images/burger.png',
        price: 10.99,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: 'Extra Bacon', price: 1.50),
          AddOn(name: 'Extra Avocado', price: 2.00)
        ]),
    Food(
        name: 'Spinach Salad',
        description:
            'Fresh spinach with strawberries, almonds, and balsamic vinaigrette.',
        imagePath: 'images/burger.png',
        price: 8.99,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: 'Feta Cheese', price: 1.50),
          AddOn(name: 'Almonds', price: 1.00)
        ]),
    Food(
        name: 'Quinoa Salad',
        description:
            'Quinoa with black beans, corn, and cilantro lime dressing.',
        imagePath: 'images/burger.png',
        price: 9.49,
        category: FoodCategory.salads,
        availableAddOns: [
          AddOn(name: 'Grilled Chicken', price: 2.50),
          AddOn(name: 'Avocado', price: 2.00)
        ]),
    Food(
        name: 'French Fries',
        description: 'Crispy golden French fries.',
        imagePath: 'images/burger.png',
        price: 2.99,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: 'Cheese Sauce', price: 1.00),
          AddOn(name: 'Bacon Bits', price: 1.50)
        ]),
    Food(
        name: 'Onion Rings',
        description: 'Crispy battered onion rings.',
        imagePath: 'images/burger.png',
        price: 3.49,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: 'Ranch Dip', price: 0.99),
          AddOn(name: 'BBQ Sauce', price: 0.75)
        ]),
    Food(
        name: 'Sweet Potato Fries',
        description: 'Sweet potato fries with a hint of cinnamon.',
        imagePath: 'images/burger.png',
        price: 3.99,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: 'Marshmallow Dip', price: 1.00),
          AddOn(name: 'Honey', price: 0.75)
        ]),
    Food(
        name: 'Garlic Bread',
        description: 'Toasted garlic bread with a side of marinara sauce.',
        imagePath: 'images/burger.png',
        price: 4.49,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: 'Cheese', price: 1.00),
          AddOn(name: 'Extra Garlic Butter', price: 0.50)
        ]),
    Food(
        name: 'Coleslaw',
        description: 'Freshly made coleslaw with a tangy dressing.',
        imagePath: 'images/burger.png',
        price: 2.49,
        category: FoodCategory.sides,
        availableAddOns: [
          AddOn(name: 'Extra Dressing', price: 0.50),
          AddOn(name: 'Raisins', price: 0.75)
        ]),
    Food(
        name: 'Chocolate Cake',
        description: 'Rich and moist chocolate cake.',
        imagePath: 'images/burger.png',
        price: 5.99,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: 'Whipped Cream', price: 0.50),
          AddOn(name: 'Extra Chocolate Sauce', price: 0.75)
        ]),
    Food(
        name: 'Cheesecake',
        description: 'Classic New York style cheesecake.',
        imagePath: 'images/burger.png',
        price: 6.49,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: 'Strawberry Sauce', price: 1.00),
          AddOn(name: 'Blueberries', price: 1.50)
        ]),
    Food(
        name: 'Ice Cream Sundae',
        description:
            'Vanilla ice cream with chocolate sauce, whipped cream, and a cherry on top.',
        imagePath: 'images/burger.png',
        price: 4.99,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: 'Sprinkles', price: 0.50),
          AddOn(name: 'Nuts', price: 0.75)
        ]),
    Food(
        name: 'Apple Pie',
        description: 'Warm apple pie with a flaky crust.',
        imagePath: 'images/burger.png',
        price: 5.49,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: 'Vanilla Ice Cream', price: 1.50),
          AddOn(name: 'Caramel Sauce', price: 0.75)
        ]),
    Food(
        name: 'Brownie',
        description: 'Chewy chocolate brownie with nuts.',
        imagePath: 'images/burger.png',
        price: 3.99,
        category: FoodCategory.desserts,
        availableAddOns: [
          AddOn(name: 'Ice Cream', price: 1.50),
          AddOn(name: 'Whipped Cream', price: 0.50)
        ]),
    Food(
        name: 'Cola',
        description: 'Classic cola beverage.',
        imagePath: 'images/burger.png',
        price: 1.99,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: 'Lemon Slice', price: 0.25),
          AddOn(name: 'Extra Ice', price: 0.10)
        ]),
    Food(
        name: 'Lemonade',
        description: 'Refreshing lemonade made from fresh lemons.',
        imagePath: 'images/burger.png',
        price: 2.49,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: 'Mint', price: 0.50),
          AddOn(name: 'Extra Ice', price: 0.10)
        ]),
    Food(
        name: 'Iced Tea',
        description: 'Chilled iced tea with a hint of lemon.',
        imagePath: 'images/burger.png',
        price: 1.99,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: 'Lemon Slice', price: 0.25),
          AddOn(name: 'Honey', price: 0.50)
        ]),
    Food(
        name: 'Coffee',
        description: 'Hot brewed coffee.',
        imagePath: 'images/burger.png',
        price: 1.49,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: 'Cream', price: 0.25),
          AddOn(name: 'Sugar', price: 0.10)
        ]),
    Food(
        name: 'Milkshake',
        description:
            'Creamy milkshake available in chocolate, vanilla, or strawberry.',
        imagePath: 'images/burger.png',
        price: 3.99,
        category: FoodCategory.drinks,
        availableAddOns: [
          AddOn(name: 'Whipped Cream', price: 0.50),
          AddOn(name: 'Sprinkles', price: 0.25)
        ]),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  void addToCart(Food food, List<AddOn> selectedAddOns) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddOns =
          const ListEquality().equals(item.selectedAddOns, selectedAddOns);

      return isSameFood && isSameAddOns;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddOns: selectedAddOns));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
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
      double itemTotal = cartItem.food.price;

      for (AddOn addOn in cartItem.selectedAddOns) {
        itemTotal += addOn.price;
      }

      total += itemTotal * cartItem.quantity;
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
}
