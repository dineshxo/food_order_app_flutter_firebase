import 'package:food_order/models/food.dart';

final List<Food> foodMenu = [
  Food(
    name: 'Classic Burger',
    description:
        'A classic beef burger with lettuce, tomato, and cheese. Served on a toasted sesame bun with a side of our special sauce.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%202.jpg?alt=media&token=25c6b0a0-7b5a-464a-ac16-afe9463e7f85',
    price: 8.99,
    category: FoodCategory.burgers,
  ),
  Food(
    name: 'BBQ Burger',
    description:
        'Beef burger with BBQ sauce, bacon, and cheddar cheese. Topped with crispy onions and served with a side of pickles.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger.png?alt=media&token=436d876f-c0f1-4f80-9aed-5395386e74dc',
    price: 10.99,
    category: FoodCategory.burgers,
  ),
  Food(
    name: 'Veggie Burger',
    description:
        'A delicious veggie patty with lettuce, tomato, and avocado. Served with a whole grain bun and a side of our tangy vegan mayo.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%203.jpg?alt=media&token=4213437b-9227-4b6c-a118-eeea56f12e3f',
    price: 9.99,
    category: FoodCategory.burgers,
  ),
  Food(
    name: 'Spicy Chicken Burger',
    description:
        'Crispy chicken with spicy sauce, lettuce, and tomato. Served on a brioche bun with a side of creamy ranch dip.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%204.jpg?alt=media&token=2c1b6370-f23c-4ac2-9bf2-d57c64ea64b9',
    price: 9.49,
    category: FoodCategory.burgers,
  ),
  Food(
    name: 'Double Cheeseburger',
    description:
        'Two beef patties with double cheese, lettuce, and tomato. Comes with a side of our signature fries and a pickle spear.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/burger%205.jpg?alt=media&token=65d86b2f-6b91-4b05-8d42-b93db8155669',
    price: 11.99,
    category: FoodCategory.burgers,
  ),
  Food(
    name: 'Caesar Salad',
    description:
        'Fresh romaine lettuce with Caesar dressing, croutons, and parmesan cheese. Garnished with a lemon wedge and fresh black pepper.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%201.jpg?alt=media&token=5cb7c8b9-1985-479f-82d5-01b2c54371d2',
    price: 7.99,
    category: FoodCategory.salads,
  ),
  Food(
    name: 'Greek Salad',
    description:
        'A mix of cucumbers, tomatoes, olives, and feta cheese. Drizzled with olive oil and sprinkled with oregano for authentic flavor.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%202.jpg?alt=media&token=8a435a7e-7764-4a89-8e4a-0009b0c41eea',
    price: 8.49,
    category: FoodCategory.salads,
  ),
  Food(
    name: 'Cobb Salad',
    description:
        'Romaine lettuce, chicken, bacon, avocado, egg, and blue cheese. Tossed with a house-made vinaigrette and served with a roll.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%203.jpg?alt=media&token=e99610ff-7664-47a9-835a-db420ac1456b',
    price: 10.99,
    category: FoodCategory.salads,
  ),
  Food(
    name: 'Spinach Salad',
    description:
        'Fresh spinach with strawberries, almonds, and balsamic vinaigrette. Topped with goat cheese crumbles for added richness.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%204.jpg?alt=media&token=3124f706-28b0-43c3-b89c-06208e3a675b',
    price: 8.99,
    category: FoodCategory.salads,
  ),
  Food(
    name: 'Quinoa Salad',
    description:
        'Quinoa with black beans, corn, and cilantro lime dressing. Perfectly seasoned and topped with fresh cilantro and lime wedges.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/salad%205.jpg?alt=media&token=6ac8a6b3-050d-4990-bf3c-a0e854d48542',
    price: 9.49,
    category: FoodCategory.salads,
  ),
  Food(
    name: 'French Fries',
    description:
        'Crispy golden French fries. Lightly salted and served with your choice of ketchup or aioli for dipping.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%201.jpg?alt=media&token=8b960f88-674a-45a3-9f40-06cc7bc593d6',
    price: 2.99,
    category: FoodCategory.sides,
  ),
  Food(
    name: 'Onion Rings',
    description:
        'Crispy battered onion rings. Served with a side of zesty dipping sauce.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%202.jpg?alt=media&token=437a974d-cc5f-418d-becb-7094412c228f',
    price: 3.49,
    category: FoodCategory.sides,
  ),
  Food(
    name: 'Sweet Potato Fries',
    description:
        'Sweet potato fries with a hint of cinnamon. Served with a side of honey mustard dipping sauce.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%203.jpg?alt=media&token=a879ff17-ed39-447c-9ff8-75d91c432010',
    price: 3.99,
    category: FoodCategory.sides,
  ),
  Food(
    name: 'Garlic Bread',
    description:
        'Toasted garlic bread with a side of marinara sauce. Perfectly crisp and buttery, with a rich garlic flavor.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%204.jpg?alt=media&token=902c274a-0f19-4471-8f13-497c2bda7e16',
    price: 4.49,
    category: FoodCategory.sides,
  ),
  Food(
    name: 'Coleslaw',
    description:
        'Freshly made coleslaw with a tangy dressing. A perfect complement to any meal, with a crunchy texture and creamy flavor.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/side%205.jpg?alt=media&token=62e300ad-f2ba-426b-a10d-c3eda2d0b177',
    price: 2.49,
    category: FoodCategory.sides,
  ),
  Food(
    name: 'Chocolate Cake',
    description:
        'Rich and moist chocolate cake. Topped with a decadent chocolate ganache and served with a side of whipped cream.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%201.jpg?alt=media&token=6299aeb2-4bde-43f2-857e-6e34cf49c9e6',
    price: 5.99,
    category: FoodCategory.desserts,
  ),
  Food(
    name: 'Cheesecake',
    description:
        'Classic New York style cheesecake. Served with a berry compote and a sprinkle of powdered sugar for an elegant touch.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%202.jpg?alt=media&token=26ec12b1-0431-4bf1-80ac-9e6b8358ace3',
    price: 6.49,
    category: FoodCategory.desserts,
  ),
  Food(
    name: 'Ice Cream Sundae',
    description:
        'Vanilla ice cream with chocolate sauce, whipped cream, and a cherry on top. Served with a side of rainbow sprinkles.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%203.jpg?alt=media&token=b2327ac5-0342-4eeb-b8df-99d6079e2cdc',
    price: 4.99,
    category: FoodCategory.desserts,
  ),
  Food(
    name: 'Apple Pie',
    description:
        'Warm apple pie with a flaky crust. Served with a scoop of vanilla ice cream for a classic dessert experience.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%204.jpg?alt=media&token=5892ce64-051b-478b-abce-ce1de2874326',
    price: 5.49,
    category: FoodCategory.desserts,
  ),
  Food(
    name: 'Brownie',
    description:
        'Chewy chocolate brownie with nuts. Served warm with a drizzle of caramel sauce for an extra indulgent treat.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/dessert%205.jpg?alt=media&token=3e96ee28-13ff-4de3-9f08-9f8b004dc2b6',
    price: 3.99,
    category: FoodCategory.desserts,
  ),
  Food(
    name: 'Cola',
    description:
        'Classic cola beverage. Ice-cold and refreshing, perfect for any meal.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%201.jpg?alt=media&token=ff877f4d-51d1-441c-b87f-8eed24b071cf',
    price: 1.99,
    category: FoodCategory.drinks,
  ),
  Food(
    name: 'Lemonade',
    description:
        'Refreshing lemonade made from fresh lemons. Served chilled with a slice of lemon and a sprig of mint.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%202.jpg?alt=media&token=1a370776-9c96-4000-a270-f0badc234704',
    price: 2.49,
    category: FoodCategory.drinks,
  ),
  Food(
    name: 'Iced Tea',
    description:
        'Chilled iced tea with a hint of lemon. Sweetened to perfection and served over ice.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%203.jpg?alt=media&token=a6dfcceb-f454-4130-9cf9-f71ea424e49f',
    price: 1.99,
    category: FoodCategory.drinks,
  ),
  Food(
    name: 'Coffee',
    description:
        'Hot brewed coffee. Rich and aromatic, perfect for a morning pick-me-up or an afternoon treat.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%204.jpg?alt=media&token=a4976bcc-d81d-490b-831f-b6dbc470b9e9',
    price: 1.49,
    category: FoodCategory.drinks,
  ),
  Food(
    name: 'Milkshake',
    description:
        'Creamy milkshake available in chocolate, vanilla, or strawberry. Topped with whipped cream and a cherry.',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/food-delivery-applicatio-39ecd.appspot.com/o/drink%205.jpg?alt=media&token=71ab9dcf-78f4-4e7f-931b-2947ce1a0f7e',
    price: 3.99,
    category: FoodCategory.drinks,
  ),
];
