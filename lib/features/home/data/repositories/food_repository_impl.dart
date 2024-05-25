import 'package:fpdart/fpdart.dart';
import 'package:swagat_restaurant/core/error/exception.dart';
import 'package:swagat_restaurant/core/error/failure.dart';
import 'package:swagat_restaurant/features/home/data/datasources/restaurant_remote_data_source.dart';
import 'package:swagat_restaurant/features/home/domain/entities/food.dart';
import 'package:swagat_restaurant/features/home/domain/repositories/food_repository.dart';

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
