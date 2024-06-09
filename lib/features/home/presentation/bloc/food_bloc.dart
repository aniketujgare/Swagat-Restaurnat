import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/food.dart';
import '../../domain/usecases/get_foods.dart';

part 'food_bloc.freezed.dart';
part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetFoods _getFoods;
  FoodBloc({required GetFoods getFoods})
      : _getFoods = getFoods,
        super(const FoodState.initial()) {
    on<FoodEvent>((event, emit) => emit(const FoodState.loading()));

    on<_FoodGet>(_getFoodList);
  }

  void _getFoodList(_FoodGet event, Emitter<FoodState> emit) async {
    final res = await _getFoods(NoParams());

    res.fold(
      (l) => emit(FoodState.faiure(l.message)),
      (r) => emit(FoodState.success(r)),
    );
  }
}
