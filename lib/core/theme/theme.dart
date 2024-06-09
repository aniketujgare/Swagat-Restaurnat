import 'package:flutter/material.dart';

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
    scaffoldBackgroundColor: Colors.white,
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
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
      ),
      displaySmall:
          TextStyle(fontFamily: 'Gilroy', color: AppPallete.misticBlueShade1),
      bodyLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
      ),
      bodySmall:
          TextStyle(fontFamily: 'Gilroy', color: AppPallete.misticBlueShade1),
      headlineLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
      ),
      headlineSmall:
          TextStyle(fontFamily: 'Gilroy', color: AppPallete.misticBlueShade1),
      labelLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.misticBlueShade1,
      ),

      // headline2: TextStyle(fontFamily: 'CustomFont', fontWeight: FontWeight.bold),
      // headline3: TextStyle(fontFamily: 'CustomFont', fontWeight: FontWeight.bold),
      // headline4: TextStyle(fontFamily: 'CustomFont', fontWeight: FontWeight.bold),
      // headline5: TextStyle(fontFamily: 'CustomFont', fontWeight: FontWeight.bold),
      // headline6: TextStyle(fontFamily: 'CustomFont', fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: AppPallete.black,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: AppPallete.black,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Gilroy',
        color: AppPallete.black,
      ),
      // bodyText1: TextStyle(fontFamily: 'CustomFont'),
      // bodyText2: TextStyle(fontFamily: 'CustomFont'),
      // caption: TextStyle(fontFamily: 'CustomFont'),
      // button: TextStyle(fontFamily: 'CustomFont'),
      // overline: TextStyle(fontFamily: 'CustomFont'),
    ),
  );
}
