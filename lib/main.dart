import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swagat_restaurant/features/home/presentation/bloc/food_bloc.dart';

import 'core/theme/theme.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<FoodBloc>(),
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
    return MaterialApp(
      title: 'Swagat Restaurant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,

      // theme: AppTheme.darkThemeMode,
      home: const HomePage(),
    );
  }
}
