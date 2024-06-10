import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/sized_boxes.dart';

import '../../../home/presentation/widgets/bag_icon_button.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                  'My Account',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(),
                AppBarActionIconButton(
                  icon: Icons.shopping_bag_outlined,
                  onPressed: () {},
                  badge: Text(
                    '3',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppPallete.whiteColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBoxHeight15,
          Center(
            child: Container(
                height: 95,
                width: 95,
                margin: EdgeInsets.only(right: Constants.horizontalMargin),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://arenos3.s3.ap-south-1.amazonaws.com/areno_app/Home+Page+images/Fitness+Routine+card.png',
                    ),
                  ),
                ),
                child: Align(
                    alignment: const Alignment(1.2, 1.2),
                    child: Container(
                      width: 38
                          .w, // Width and height set to double the icon size to include padding and border
                      height: 38.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit_square),
                        color: AppPallete.green,
                        iconSize: 19.sp,
                        onPressed: () {
                          // Define the action that occurs when the button is pressed
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0XFFECF8F1),
                          ),
                        ),
                      ),
                    ))),
          ),
          SizedBoxHeight15,
          Text('Aniket Subhash Ujgare',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18.sp,
                  )),
          SizedBoxHeight5,
          Text(
            'aniketujgare@gmail.com',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBoxHeight25,
          Container(
            height: 8,
            color: AppPallete.misticBlueShade4.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => Container(
                height: 2,
                color: AppPallete.misticBlueShade4.withOpacity(0.3),
              ),
              itemBuilder: (_, index) {
                final item = items[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalMargin,
                    vertical: Constants.horizontalMargin / 3,
                  ), // Adjust padding as needed
                  leading: Icon(
                    item['icon'] as IconData,
                    color: AppPallete.misticBlue,
                  ),
                  title: Text(
                    item['title'] as String,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppPallete.misticBlue,
                        ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 16.sp, color: AppPallete.misticBlue),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final items = [
    {
      'title': 'Favorite List',
      'icon': Icons.favorite,
    },
    {
      'title': 'Order History',
      'icon': Icons.receipt,
    },
    {
      'title': 'Wallet',
      'icon': Icons.wallet,
    },
    {
      'title': 'Promotion',
      'icon': Icons.local_offer,
    },
    {
      'title': 'Payment Method',
      'icon': Icons.payment,
    }
  ];
}
