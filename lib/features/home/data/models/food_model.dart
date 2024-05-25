// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swagat_restaurant/features/home/domain/entities/food.dart';

import 'package:swagat_restaurant/features/home/domain/entities/food_type.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

@freezed
class FoodModel extends Food with _$FoodModel {
  const factory FoodModel({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "food_category") required FoodCategory foodCategory,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "price") required int price,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
