enum FoodCategory { burgers, salads, sides, desserts, drinks }

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
  });
}
