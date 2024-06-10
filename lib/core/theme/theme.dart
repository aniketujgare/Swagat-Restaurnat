import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final lightThemeMode = ThemeData.light().copyWith(
    chipTheme: const ChipThemeData(
        color: WidgetStatePropertyAll(AppPallete.backgroundColor),
        side: BorderSide.none),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
    //! Text Reference: https://api.flutter.dev/flutter/material/TextTheme-class.html
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
        fontSize: 57.sp,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
        fontSize: 45.sp,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.misticBlueShade1,
        fontSize: 36.sp,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
        fontSize: 16.sp,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.black,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.misticBlueShade1,
        fontSize: 12.sp,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
        fontSize: 32.sp,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
        fontSize: 28.sp,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.misticBlueShade1,
        fontSize: 24.sp,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
        fontSize: 14.sp,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
        fontSize: 12.sp,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.misticBlueShade1,
        fontSize: 11.sp,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
        fontSize: 16.sp,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
        fontSize: 22.sp,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.misticBlueShade1,
        fontSize: 14.sp,
      ),
    ),
  );
}
