import 'package:fpdart/fpdart.dart';
import 'package:swagat_restaurant/features/home/domain/entities/food.dart';

import '../../../../core/error/failure.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<Food>>> getFoodItems();
}
