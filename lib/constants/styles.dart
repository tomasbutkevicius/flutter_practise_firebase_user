import 'package:flutter/cupertino.dart';

class StylesConstants {
  static const borderRadius = 2.0;
  static const fontFamily = 'FranklinGothic';
  static const double heightAppBar = 80.0;

  static BoxConstraints getConstraintsDropdown(BuildContext context) => BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.7,
        maxWidth: MediaQuery.of(context).size.width * 0.7,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      );
}
