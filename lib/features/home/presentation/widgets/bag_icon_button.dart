import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: AppPallete.misticBlueShade1,
          ),
          iconSize: 28,
          padding: EdgeInsets.zero,
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppPallete.whiteColor),
          ),
        ),
        Positioned(
          bottom: 11, // Adjust this value to change the vertical offset
          right: 11,
          child: CircleAvatar(
            backgroundColor: AppPallete.red,
            radius: 6,
            child: Text(
              '3',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppPallete.whiteColor,
                    fontSize: 10,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
