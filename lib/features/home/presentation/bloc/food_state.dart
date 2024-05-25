part of 'food_bloc.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState.initial() = _Initial;
  const factory FoodState.loading() = _Loading;
  const factory FoodState.faiure(
    final String error,
  ) = _Failure;
  const factory FoodState.success(
    final List<Food> foods,
  ) = _Success;
}
