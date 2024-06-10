import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_pallete.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
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
            decoration: const BoxDecoration(),
            child: Text(
              'Best Deals',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8,
            color: AppPallete.misticBlueShade4.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              scrollDirection: Axis.vertical,
              controller: bannerCotroller,
              padding: EdgeInsets.all(Constants.horizontalMargin),
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: Constants.horizontalMargin),
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
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10).w,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10).w,
        child: Container(
          height: 145.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.shutterstock.com/image-vector/delicious-fluffy-pancake-frying-pan-260nw-1120833698.jpg',
            ),
          )),
        ),
      ),
    );
  }
}
