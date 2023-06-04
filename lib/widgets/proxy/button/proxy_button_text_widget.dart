import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter/material.dart';

class ProxyButtonTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final ProxyFontSize fontSize;
  final ProxyFontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final bool isUpperCase;
  final ProxyFontFamily fontFamily;

  const ProxyButtonTextWidget({
    Key? key,
    required this.text,
    this.color = ThemeColors.mintBlue,
    this.textColor,
    this.fontSize = ProxyFontSize.medium,
    this.fontWeight = ProxyFontWeight.bold,
    this.padding = const EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 40.0,
    ),
    this.fontFamily = ProxyFontFamily.primary,
    this.border,
    this.onPressed,
    this.isUpperCase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all<Color>(color),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.white),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: ProxyConstants.getFontSize(fontSize),
              fontWeight: ProxyConstants.getFontWeight(fontWeight),
            ),
          ),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontFamily: ProxyConstants.getFontFamily(fontFamily),
          ),
        ),
      ),
    );
  }
}
