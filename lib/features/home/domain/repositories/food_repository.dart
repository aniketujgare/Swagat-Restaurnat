import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/food.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<Food>>> getFoodItems();
}
