import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/styles.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';

enum ProxyFontSize { small, medium, large, extraLarge }

enum ProxyFontColor { dark, light, white, error }

enum ProxyFontFamily { primary, secondary }

enum ProxyFontWeight { regular, bold }

enum ProxySpacing { extraSmall, small, medium, large, extraLarge, huge }

class ProxyConstants {
  static const Map<ProxyFontSize, double> sizeVariants = {
    ProxyFontSize.small: 14.0,
    ProxyFontSize.medium: 16.0,
    ProxyFontSize.large: 18.0,
    ProxyFontSize.extraLarge: 24.0,
  };

  static double getFontSize(ProxyFontSize value) => sizeVariants[value]!;

  static const Map<ProxyFontWeight, FontWeight> fontWeightVariants = {
    ProxyFontWeight.regular: FontWeight.w500,
    ProxyFontWeight.bold: FontWeight.w900,
  };

  static FontWeight getFontWeight(ProxyFontWeight value) => fontWeightVariants[value]!;

  static const Map<ProxyFontColor, Color> fontColorVariants = {
    ProxyFontColor.dark: ThemeColors.greyTextDark,
    ProxyFontColor.light: ThemeColors.greyText,
    ProxyFontColor.white: ThemeColors.white,
    ProxyFontColor.error: ThemeColors.red,
  };

  static Color getFontColor(ProxyFontColor value) => fontColorVariants[value]!;

  static Map<ProxyFontFamily, String> fontFamilyVariants = {
    ProxyFontFamily.primary: StylesConstants.fontFamilyPrimary,
    ProxyFontFamily.secondary: StylesConstants.fontFamilySecondary,
  };

  static String getFontFamily(ProxyFontFamily value) => fontFamilyVariants[value]!;

  static const Map<ProxySpacing, double> spacingVariants = {
    ProxySpacing.extraSmall: 5.0,
    ProxySpacing.small: 10.0,
    ProxySpacing.medium: 20.0,
    ProxySpacing.large: 30.0,
    ProxySpacing.extraLarge: 40.0,
    ProxySpacing.huge: 50.0,
  };

  static double getSpacing(ProxySpacing value) => spacingVariants[value]!;
}
