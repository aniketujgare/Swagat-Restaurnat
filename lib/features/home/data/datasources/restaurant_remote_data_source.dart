import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exception.dart';
import '../models/food_model.dart';

abstract interface class RestaurantRemoteDataSource {
  Future<List<FoodModel>> getRestaurantMenu();
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final SupabaseClient supabaseClient;

  RestaurantRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<List<FoodModel>> getRestaurantMenu() async {
    try {
      final menuData = await supabaseClient.from('food_items').select();
      return menuData.map((e) => FoodModel.fromJson(e)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
