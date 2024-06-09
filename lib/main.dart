import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'core/routes/router.dart';
import 'core/theme/theme.dart';
import 'features/home/presentation/bloc/food_bloc.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<FoodBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<DashboardCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
  // Example usage
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Swagat Restaurant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,

      // theme: AppTheme.darkThemeMode,
    );
  }
}
