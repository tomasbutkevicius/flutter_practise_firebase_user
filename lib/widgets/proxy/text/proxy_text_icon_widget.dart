import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class ProxyTextIconWidget extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final double width;
  final bool isUppercase;

  const ProxyTextIconWidget({
    Key? key,
    this.text = '',
    this.color = ThemeColors.greyTextDark,
    required this.icon,
    this.width = 50.0,
    this.isUppercase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: color,
          width: width,
          semanticsLabel: text,
        ),
        const ProxySpacingVerticalWidget(),
        ProxyTextWidget(
          text: text,
          fontColorType: ProxyFontColor.dark,
          isUppercase: isUppercase,
          fontSize: ProxyFontSize.extraLarge,
          fontWeight: ProxyFontWeight.semiBold,
        ),
      ],
    );
  }
}
