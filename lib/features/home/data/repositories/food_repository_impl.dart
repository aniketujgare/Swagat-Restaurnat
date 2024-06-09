import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/food.dart';
import '../../domain/repositories/food_repository.dart';
import '../datasources/restaurant_remote_data_source.dart';

class FoodRepositoryImpl implements FoodRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  FoodRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Food>>> getFoodItems() async {
    try {
      final res = await remoteDataSource.getRestaurantMenu();
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
