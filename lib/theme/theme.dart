import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/styles.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ThemeColors.mintBlue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ThemeColors.greyTextDark),
    hintColor: ThemeColors.greyTextDark,
    dividerColor: ThemeColors.white,
    scaffoldBackgroundColor: ThemeColors.white,
    canvasColor: ThemeColors.white,
    fontFamily: StylesConstants.fontFamily,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45, width: 1.0),
      ),
    ),
  );
}
