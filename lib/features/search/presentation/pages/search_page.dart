import 'package:flutter/material.dart';

import '../../../../core/common/widgets/food_and_kitchen_search_bar.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/sized_boxes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bannerCotroller =
      PageController(viewportFraction: 0.91, keepPage: true);
  final trendingMealController =
      PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      trendingMealController
          .jumpTo(trendingMealController.position.maxScrollExtent * 0.2);
    });
  }

  @override
  void dispose() {
    bannerCotroller.dispose();
    trendingMealController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: Constants.horizontalMargin,
              right: Constants.horizontalMargin / 3,
            ),
            decoration: const BoxDecoration(),
            child: Text(
              'Search',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FoodAndKitchenSearchBar(),
          SizedBox(
            height: 35,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: Constants.horizontalMargin),
              children: [
                'All Items',
                'Popular items',
                'All Kitchen',
                'Popular Dishes',
                'Veg Meal',
              ]
                  .map(
                    (e) => FilterChip(
                      backgroundColor: AppPallete.whiteColor,
                      color: const WidgetStatePropertyAll<Color>(
                          AppPallete.whiteColor),
                      onSelected: (v) => {},
                      label: Text(e),
                      padding: EdgeInsets.zero,
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBoxHeight8,
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 8,
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.horizontalMargin),
              scrollDirection: Axis.vertical,
              controller: bannerCotroller,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Constants.horizontalMargin / 4,
                    horizontal: Constants.horizontalMargin / 4,
                  ),
                  child: _buildDisplayCard(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Card _buildDisplayCard(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                fit: BoxFit.cover,
                image: const NetworkImage(
                  'https://arenos3.s3.ap-south-1.amazonaws.com/areno_app/Home+Page+images/Fitness+Routine+card.png',
                ),
              )),
          child: const Center(
            child: Text(
              'Exercise',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
