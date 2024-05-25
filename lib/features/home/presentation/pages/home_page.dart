import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swagat_restaurant/core/common/widgets/loader.dart';
import 'package:swagat_restaurant/core/utils/show_snackbar.dart';
import 'package:swagat_restaurant/features/home/domain/entities/food.dart';

import '../../data/models/food_model.dart';
import '../bloc/food_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<FoodBloc>().add(const FoodEvent.foodGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final menuData =
            await Supabase.instance.client.from('food_items').select();

        var v = menuData.map((e) => FoodModel.fromJson(e)).toList();
        print(v.first.name);
      }),
      body: BlocConsumer<FoodBloc, FoodState>(
        listener: (context, state) {
          state.mapOrNull(
            faiure: (value) => showSnackBar(context, value.error),
          );
        },
        builder: (context, state) {
          return state.mapOrNull(
                loading: (_) => const Loader(),
                success: (value) => _buildFoodList(value.foods),
              ) ??
              const Loader();
        },
      ),
    );
  }

  _buildFoodList(List<Food> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(foods[index].name);
      },
    );
  }
}
