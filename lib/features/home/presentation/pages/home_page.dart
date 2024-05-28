import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swagat_restaurant/core/constants/constants.dart';
import 'package:swagat_restaurant/core/theme/app_pallete.dart';
import 'package:swagat_restaurant/core/utils/sized_boxes.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../domain/entities/food.dart';
import '../bloc/food_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bannerCotroller =
      PageController(viewportFraction: 0.92, keepPage: true);
  @override
  void dispose() {
    bannerCotroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: Constants.horizontalMargin,
              right: Constants.horizontalMargin / 3,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(
                      0XFFD2D3D7), // Change this to your desired border color
                  width: 1.0, // Change this to your desired border width
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/place.svg',
                  color: AppPallete.green,
                  height: 25,
                ),
                SizedBoxWidth10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery To',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Row(
                      children: [
                        Text(
                          'Banasree B-Block',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppPallete.misticBlueShade1,
                      ),
                      iconSize: 28,
                      padding: EdgeInsets.zero,
                    ),
                    Positioned(
                      bottom:
                          10, // Adjust this value to change the vertical offset
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: AppPallete.red,
                        radius: 7,
                        child: Text(
                          '3',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppPallete.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.horizontalMargin,
              vertical: Constants.horizontalMargin,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: AppPallete.green,
                ), // Leading widget
                suffixIcon: IconButton(
                  // Trailing widget
                  icon: const Icon(
                    (CupertinoIcons.slider_horizontal_3),
                    color: AppPallete.green,
                  ),
                  onPressed: () {
                    // Implement the clear functionality here
                  },
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppPallete.transparentColor)),
                fillColor: AppPallete.misticBlueShade4.withOpacity(0.3),
                hintText: 'Search food and Ketchens',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppPallete.misticBlueShade3,
                      fontSize: 15,
                    ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 12.0),
              ),
            ),
          ),
          SizedBox(
            height: 95,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: ['Breakfast', 'Healthy', 'Dessert', 'Meal', 'Pizza']
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.only(left: Constants.horizontalMargin),
                      padding: EdgeInsets.only(
                          right: Constants.horizontalMargin / 2),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppPallete.green,
                            radius: 30,
                            child: ClipOval(
                              child: Image.network(
                                'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?size=338&ext=jpg&ga=GA1.1.44546679.1716681600&semt=sph',
                                fit: BoxFit.scaleDown,
                                height: 50,
                              ),
                            ),
                          ),
                          SizedBoxHeight4,
                          Text(
                            e,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppPallete.black,
                                      height: 2,
                                      fontSize: 12,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: Constants.horizontalMargin / 2),
            height: 8,
            color: AppPallete.misticBlueShade4.withOpacity(0.3),
          ),
          SizedBox(
            height: 150,
            child: PageView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              controller: bannerCotroller,
              itemBuilder: (_, index) {
                return _buildDisplayCard(context);
              },
            ),
          ),
          SizedBoxHeight4,
          Center(
            child: SmoothPageIndicator(
              controller: bannerCotroller,
              axisDirection: Axis.horizontal,
              effect: const ExpandingDotsEffect(
                  dotColor: AppPallete.misticBlueShade3,
                  activeDotColor: AppPallete.black,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 2),
              count: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Constants.horizontalMargin),
            height: 8,
            color: AppPallete.misticBlueShade4.withOpacity(0.3),
          ),
          // SizedBoxHeight4,
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Constants.horizontalMargin / 2,
              horizontal: Constants.horizontalMargin,
            ),
            child: Text(
              'Trending Meals',
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.horizontalMargin,
              ),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                3,
                (index) => SizedBox(
                    width: 320, child: _buildTrendingMealCard(context)),
              ).toList(),
            ),
          ),
          SizedBoxHeight4,
        ],
      ),
      // body:

      //  BlocConsumer<FoodBloc, FoodState>(
      //   listener: (context, state) {
      //     state.mapOrNull(
      //       faiure: (value) => showSnackBar(context, value.error),
      //     );
      //   },
      //   builder: (context, state) {
      //     return state.mapOrNull(
      //           initial: (value) {
      //             context.read<FoodBloc>().add(const FoodEvent.foodGet());
      //             return;
      //           },
      //           loading: (_) => const Loader(),
      //           success: (value) => _buildFoodList(value.foods),
      //         ) ??
      //         const SizedBox.shrink();
      //   },
      // ),
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
        child: SizedBox(
          height: 150,
          child: Image.network(
            'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-order-now-restaurant-discount-banner-design-template-c8abb6b3b188751b2cb637bc3871cbfb_screen.jpg?ts=1617107213',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Card _buildTrendingMealCard(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppPallete.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    Image.network(
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-order-now-restaurant-discount-banner-design-template-c8abb6b3b188751b2cb637bc3871cbfb_screen.jpg?ts=1617107213',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: CircleAvatar(
                        backgroundColor: AppPallete.whiteColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.heart_fill),
                          color: AppPallete.green,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppPallete.whiteColor,
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Constants.horizontalMargin / 2.3,
                            horizontal: Constants.horizontalMargin,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: '₹ ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 20,
                                    height: 0,
                                    color: AppPallete.green,
                                  ),
                              children: [
                                TextSpan(
                                  text: '140',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 16,
                                        height: 0,
                                        color: AppPallete.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxHeight8,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vidarbha Special Thali',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amber.shade700,
                            size: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              text: ' 4.5',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Text(
                                    '(25+)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: AppPallete.misticBlueShade1,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBoxHeight2,
                      Row(
                        children: [
                          const Icon(
                            Icons.delivery_dining_outlined,
                            color: AppPallete.green,
                          ),
                          SizedBoxWidth4,
                          Text(
                            '₹ 35 Delivery Fee',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 14,
                                  color: AppPallete.misticBlueShade2,
                                ),
                          ),
                          SizedBoxWidth10,
                          Container(
                            width: 1,
                            height: 13,
                            color: AppPallete.misticBlueShade2,
                          ),
                          SizedBoxWidth10,
                          const Icon(
                            Icons.watch_later_rounded,
                            color: AppPallete.misticBlueShade2,
                            size: 20,
                          ),
                          SizedBoxWidth4,
                          Text(
                            '10 - 15 min',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 14,
                                  color: AppPallete.misticBlueShade2,
                                ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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


/*
 BlocConsumer<FoodBloc, FoodState>(
        listener: (context, state) {
          state.mapOrNull(
            faiure: (value) => showSnackBar(context, value.error),
          );
        },
        builder: (context, state) {
          return state.mapOrNull(
                initial: (value) {
                  context.read<FoodBloc>().add(const FoodEvent.foodGet());
                  return;
                },
                loading: (_) => const Loader(),
                success: (value) => _buildFoodList(value.foods),
              ) ??
              const SizedBox.shrink();
        },
      ),
*/