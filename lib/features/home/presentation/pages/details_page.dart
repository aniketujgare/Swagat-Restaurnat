import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/sized_boxes.dart';
import '../widgets/bag_icon_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final imagePageController = PageController();
  @override
  void dispose() {
    imagePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 220.0,
            // leadingWidth: 35,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsets.only(left: Constants.horizontalMargin),
              child: CircleAvatar(
                backgroundColor: AppPallete.whiteColor,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(CupertinoIcons.chevron_left),
                  padding: EdgeInsets.zero,
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppPallete.whiteColor),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: Constants.horizontalMargin),
                child: AppBarActionIconButton(
                  icon: Icons.shopping_bag_outlined,
                  onPressed: () {},
                  badge: Text(
                    '3',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppPallete.whiteColor,
                          fontSize: 10,
                        ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: 3,
                    controller: imagePageController,
                    scrollDirection: Axis.horizontal,
                    // itemExtent: MediaQuery.of(context).size.width,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1cmdlcnxlbnwwfHwwfHx8MA%3D%3D',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 13,
                    child: SmoothPageIndicator(
                      controller: imagePageController,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                        dotColor: AppPallete.misticBlueShade3,
                        activeDotColor: AppPallete.whiteColor,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                      count: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(
                  left: Constants.horizontalMargin,
                  top: Constants.horizontalMargin,
                ),
                child: Text(
                  'Chicken Hawaian Burger',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Constants.horizontalMargin),
                child: Text(
                  '₹ 140',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        color: AppPallete.green,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Constants.horizontalMargin,
                    top: Constants.horizontalMargin),
                child: Text(
                  'Description',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Constants.horizontalMargin),
                child: Text(
                  lorem(paragraphs: 4, words: 200),
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.8,
                        wordSpacing: 2,
                      ),
                ),
              ),
              // Container(color: Colors.purple, height: 150.0),
              // Container(color: Colors.green, height: 150.0),
            ]),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
          elevation: 5,
          shape: const RoundedRectangleBorder(),
          backgroundColor: AppPallete.whiteColor,
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                left: Constants.horizontalMargin,
                right: Constants.horizontalMargin,
                top: Constants.horizontalMargin / 2,
                bottom: Constants.horizontalMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: kToolbarHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.2,
                          color: AppPallete.misticBlueShade3,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            constraints: const BoxConstraints(
                                minHeight: 30, minWidth: 30),
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.minus,
                              color: AppPallete.misticBlueShade1,
                            ),
                            // iconSize: 22,
                            padding: EdgeInsets.zero,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppPallete.blackShade4.withOpacity(0.4),
                              ),
                            ),
                          ),
                          Text(
                            '1',
                            textAlign: TextAlign.justify,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 20,
                                    ),
                          ),
                          IconButton(
                            onPressed: () {},
                            constraints: const BoxConstraints(
                                minHeight: 30, minWidth: 30),
                            icon: const Icon(
                              CupertinoIcons.plus,
                              color: AppPallete.whiteColor,
                            ),
                            padding: EdgeInsets.zero,
                            style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppPallete.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBoxWidth16,
                  Expanded(
                    flex: 5,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                          fixedSize: const WidgetStatePropertyAll(
                              Size(0, kToolbarHeight)),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: const WidgetStatePropertyAll(
                            AppPallete.green,
                          )),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppPallete.whiteColor,
                        size: 28,
                      ),
                      label: Text(
                        'Add To Cart',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                              color: AppPallete.whiteColor,
                              height: 3.7,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
