import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';
import '../../theme/app_pallete.dart';

class FoodAndKitchenSearchBar extends StatelessWidget {
  const FoodAndKitchenSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          suffixIcon: SizedBox(
            width: 70.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 1.5.w,
                  color: AppPallete.misticBlueShade3.withOpacity(0.3),
                  height: 35.h,
                ),
                IconButton(
                  // Trailing widget
                  icon: const Icon(
                    (CupertinoIcons.slider_horizontal_3),
                    color: AppPallete.green,
                  ),
                  onPressed: () {
                    // Implement the clear functionality here
                  },
                ),
              ],
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).w,
              borderSide: const BorderSide(color: AppPallete.transparentColor)),
          fillColor: AppPallete.misticBlueShade4.withOpacity(0.3),
          hintText: 'Search food and Ketchens',
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppPallete.misticBlueShade3,
              ),
          contentPadding: EdgeInsets.all(
            Constants.horizontalMargin,
          ),
        ),
      ),
    );
  }
}
