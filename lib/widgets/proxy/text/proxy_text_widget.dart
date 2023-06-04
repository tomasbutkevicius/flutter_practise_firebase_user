import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter/cupertino.dart';

class ProxyTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final ProxyFontColor? fontColorType;
  final int? maxLines;
  final bool isOverflow;
  final bool isUnderline;
  final bool isUppercase;
  final bool isLineThrough;
  final TextAlign textAlign;
  final ProxyFontSize fontSize;
  final ProxyFontWeight fontWeight;
  final ProxyFontFamily fontFamily;

  const ProxyTextWidget({
    Key? key,
    required this.text,
    this.color = ThemeColors.greyTextDark,
    this.fontColorType,
    this.maxLines,
    this.isOverflow = false,
    this.isUnderline = false,
    this.isUppercase = false,
    this.isLineThrough = false,
    this.textAlign = TextAlign.left,
    this.fontSize = ProxyFontSize.medium,
    this.fontWeight = ProxyFontWeight.regular,
    this.fontFamily = ProxyFontFamily.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUppercase ? text.toUpperCase() : text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: isOverflow ? TextOverflow.ellipsis : TextOverflow.visible,
      style: TextStyle(
        height: 1.1,
        color: fontColorType == null ? color : ProxyConstants.getFontColor(fontColorType!),
        fontSize: ProxyConstants.getFontSize(fontSize),
        fontWeight: ProxyConstants.getFontWeight(fontWeight),
        decoration: isLineThrough
            ? TextDecoration.lineThrough
            : isUnderline
                ? TextDecoration.underline
                : null,
        fontFamily: ProxyConstants.getFontFamily(fontFamily),
      ),
    );
  }
}
