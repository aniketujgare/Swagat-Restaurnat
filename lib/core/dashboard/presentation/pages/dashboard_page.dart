import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/account/presentation/pages/account_page.dart';
import '../../../../features/deals/presentation/pages/deals_page.dart';
import '../../../../features/home/presentation/pages/explore_page.dart';
import '../../../../features/inbox/presentation/pages/inbox_page.dart';
import '../../../../features/search/presentation/pages/search_page.dart';
import '../../../theme/app_pallete.dart';
import '../cubit/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: const [
              ExplorePage(),
              SearchPage(),
              DealsPage(),
              InboxPage(),
              AccountPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<DashboardCubit>().state,
        enableFeedback: true,
        selectedItemColor: AppPallete.green,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          context.read<DashboardCubit>().changeScreen(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.square_grid_2x2,
              ),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.tag,
              ),
              label: 'Deals'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.tray,
              ),
              label: 'Inbox'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
              ),
              label: 'Account'),
        ],
      ),
    );
  }
}
