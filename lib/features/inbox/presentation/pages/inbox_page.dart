import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/sized_boxes.dart';
import '../../../home/presentation/widgets/bag_icon_button.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
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
            child: Row(
              children: [
                Text(
                  'Inbox',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(),
                AppBarActionIconButton(
                  icon: CupertinoIcons.search,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 8,
              color: AppPallete.misticBlueShade4.withOpacity(0.3),
            ),
            TabBar(
              indicatorColor: AppPallete.green,
              indicatorPadding: EdgeInsets.symmetric(
                  horizontal: Constants.horizontalMargin * 1.5),
              indicatorWeight: 2.5,
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppPallete.green,
                    fontWeight: FontWeight.bold,
                  ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'Notification'),
                Tab(text: 'Chat'),
              ],
            ),
            Container(
              height: 8,
              color: AppPallete.misticBlueShade4.withOpacity(0.3),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: Constants.horizontalMargin,
                            left: Constants.horizontalMargin,
                          ),
                          child: Text(
                            'Active Orders',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 18.sp),
                          ),
                        ),
                        ListView.separated(
                          itemCount: 2,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) => Container(
                            height: 2,
                            color: AppPallete.misticBlueShade4.withOpacity(0.3),
                          ),
                          itemBuilder: (_, index) {
                            return _buildOrderCard(context);
                          },
                        ),
                        Container(
                          height: 8,
                          color: AppPallete.misticBlueShade4.withOpacity(0.3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Constants.horizontalMargin,
                            left: Constants.horizontalMargin,
                          ),
                          child: Text(
                            'Past Orders',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 18.sp),
                          ),
                        ),
                        ListView.separated(
                          itemCount: 2,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) => Container(
                            height: 2,
                            color: AppPallete.misticBlueShade4.withOpacity(0.3),
                          ),
                          itemBuilder: (_, index) {
                            return _buildOrderCard(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: Constants.horizontalMargin),
                        child: _buildTrendingMealCard(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildOrderCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalMargin,
        vertical: Constants.horizontalMargin,
      ),
      child: Row(
        children: [
          Container(
            height: 65.w,
            width: 65.w,
            margin: EdgeInsets.only(right: Constants.horizontalMargin),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                fit: BoxFit.cover,
                image: const NetworkImage(
                  'https://arenos3.s3.ap-south-1.amazonaws.com/areno_app/Home+Page+images/Fitness+Routine+card.png',
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wade Warren Food',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '3 items  •  Order ID #023481',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppPallete.misticBlueShade1,
                    ),
              ),
              Text(
                'Oct 2, 11:31am',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: '₹ ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
              InputChip(
                onPressed: () {},
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalMargin),
                label: Text(
                  'View Order',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppPallete.black,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card _buildTrendingMealCard(BuildContext context) {
    return Card(
      elevation: 0,
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
}
