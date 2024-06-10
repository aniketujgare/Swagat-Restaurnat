import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AppBarActionIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Widget? badge;
  const AppBarActionIconButton(
      {super.key, required this.icon, required this.onPressed, this.badge});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: AppPallete.misticBlueShade1,
          ),
          // iconSize: 28,
          padding: EdgeInsets.zero,
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppPallete.whiteColor),
          ),
        ),
        if (badge != null)
          Positioned(
            bottom: 11, // Adjust this value to change the vertical offset
            right: 11,
            child: CircleAvatar(
              backgroundColor: AppPallete.red,
              radius: 6,
              child: badge,
            ),
          ),
      ],
    );
  }
}
