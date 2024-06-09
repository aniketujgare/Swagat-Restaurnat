import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/details_page.dart';
import '../../features/home/presentation/pages/explore_page.dart';
import '../dashboard/presentation/pages/dashboard_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const DashboardPage(),
        routes: [
          GoRoute(
            path: "details",
            builder: (context, state) => const DetailsPage(),
          ),
          GoRoute(
            path: "explore",
            builder: (context, state) => const ExplorePage(),
          )
        ]),
  ],
);
