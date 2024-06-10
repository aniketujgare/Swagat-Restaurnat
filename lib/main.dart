import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swagat_restaurant/core/theme/app_pallete.dart';

import 'core/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'core/routes/router.dart';
import 'core/theme/theme.dart';
import 'features/home/presentation/bloc/food_bloc.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator<FoodBloc>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator<DashboardCubit>(),
          ),
        ],
        child: const MyApp(),
      ), // Wrap your app
    ),
  );
  // Example usage
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: router,
        title: 'test',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
      ),
    );
  }
}
