import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/common/widgets/food_and_kitchen_search_bar.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/sized_boxes.dart';
import '../widgets/bag_icon_button.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final bannerCotroller =
      PageController(viewportFraction: 0.91, keepPage: true);

  @override
  void dispose() {
    bannerCotroller.dispose();
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
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0XFFD2D3D7),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/place.svg',
                  colorFilter:
                      const ColorFilter.mode(AppPallete.green, BlendMode.srcIn),
                  height: 30.h,
                ),
                SizedBoxWidth10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery To',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppPallete.misticBlue,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Banasree B-Block',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 28.w,
                          width: 28.w,
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
                AppBarActionIconButton(
                  icon: Icons.shopping_bag_outlined,
                  badge: Text(
                    '3',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppPallete.whiteColor,
                        ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FoodAndKitchenSearchBar(),
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
                            radius: 35.w,
                            child: ClipOval(
                              child: Image.network(
                                'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?size=338&ext=jpg&ga=GA1.1.44546679.1716681600&semt=sph',
                                fit: BoxFit.scaleDown,
                                height: 55.w,
                              ),
                            ),
                          ),
                          SizedBoxHeight4,
                          Text(
                            e,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
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
            height: 165.h,
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
              effect: ExpandingDotsEffect(
                  dotColor: AppPallete.misticBlueShade3,
                  activeDotColor: AppPallete.black,
                  dotHeight: 8.w,
                  dotWidth: 8.w,
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
            child: Text('Trending Meals',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                itemCount: 3,
                itemExtent: 320.w,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalMargin),
                itemBuilder: (_, index) => GestureDetector(
                    onTap: () => context.push("/details"),
                    child: _buildTrendingMealCard(context))),
          ),
          SizedBoxHeight4,
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
        child: SizedBox(
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
        borderRadius: BorderRadius.circular(10).w,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10).w,
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
                      top: 12.h,
                      right: 12.w,
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
                      top: 12.h,
                      left: 12.w,
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
                                    color: AppPallete.green,
                                  ),
                              children: [
                                TextSpan(
                                  text: '140',
                                  style: Theme.of(context).textTheme.bodyLarge,
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
                          Text('Vidarbha Special Thali',
                              style: Theme.of(context).textTheme.bodyLarge),
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
                                    fontWeight: FontWeight.bold,
                                  ),
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Text(
                                    '(25+)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
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
                                .labelLarge
                                ?.copyWith(
                                  color: AppPallete.misticBlueShade2,
                                ),
                          ),
                          SizedBoxWidth10,
                          Container(
                            width: 1,
                            height: 13.h,
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
                                .labelLarge
                                ?.copyWith(
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
}
