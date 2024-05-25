import 'food_type.dart';

class Food {
  final String id;
  final DateTime updatedAt;
  final FoodCategory foodCategory;
  final String name;
  final int price;

  Food(
      {required this.id,
      required this.updatedAt,
      required this.foodCategory,
      required this.name,
      required this.price});
}
