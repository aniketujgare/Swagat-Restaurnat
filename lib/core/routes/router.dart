import 'package:go_router/go_router.dart';
import 'package:swagat_restaurant/features/home/presentation/pages/details_page.dart';
import 'package:swagat_restaurant/features/home/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const HomePage(), routes: [
      GoRoute(
        path: "details",
        builder: (context, state) => const DetailsPage(),
      )
    ]),
  ],
);
