import 'package:food_order/models/food.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddOns;
  int quantity;

  CartItem(
      {required this.food, this.quantity = 1, required this.selectedAddOns});

  double get totalPrice {
    double addOnsPrice =
        selectedAddOns.fold(0, (sum, addOn) => sum + addOn.price);
    return (food.price + addOnsPrice) * quantity;
  }
}
