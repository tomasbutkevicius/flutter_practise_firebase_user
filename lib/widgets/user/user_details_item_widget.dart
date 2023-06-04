import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class UserDetailsItemWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  const UserDetailsItemWidget({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.greyBorders.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: LocalImageWrapperWidget(
              image: iconPath,
              width: 20,
            ),
          ),
          const VerticalDivider(
            indent: 10,
            endIndent: 10,
            color: ThemeColors.greyBorders,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProxyTextWidget(
                  color: ThemeColors.greyTextLabel,
                  fontSize: ProxyFontSize.extraSmall,
                  text: label,
                ),
                const ProxySpacingVerticalWidget(
                  size: ProxySpacing.extraSmall,
                ),
                ProxyTextWidget(
                  color: ThemeColors.white,
                  fontSize: ProxyFontSize.small,
                  text: value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
