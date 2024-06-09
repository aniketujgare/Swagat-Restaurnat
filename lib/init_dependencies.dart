import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'core/secrets/app_secrets.dart';
import 'features/home/data/datasources/restaurant_remote_data_source.dart';
import 'features/home/data/repositories/food_repository_impl.dart';
import 'features/home/domain/repositories/food_repository.dart';
import 'features/home/domain/usecases/get_foods.dart';
import 'features/home/presentation/bloc/food_bloc.dart';

part 'init_dependencies.main.dart';
