import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter/material.dart';

class UserTeaserWidget extends StatelessWidget {
  final UserModel user;

  const UserTeaserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: LocalImageWrapperWidget(
            image: IconsConstants.user,
            width: 114,
            height: 114,
          ),
        ),
        const ProxySpacingVerticalWidget(),
        ProxyTextWidget(
          text: user.username,
          fontWeight: ProxyFontWeight.regular,
          fontSize: ProxyFontSize.extraLarge,
          fontFamily: ProxyFontFamily.secondary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ProxyTextWidget(
                fontColorType: ProxyFontColor.light,
                text: user.city,
              ),
            ),
            const LocalImageWrapperWidget(
              width: 5,
              height: 5,
              image: IconsConstants.circle,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ProxyTextWidget(
                fontColorType: ProxyFontColor.light,
                text: user.id,
              ),
            ),
          ],
        ),
        const ProxySpacingVerticalWidget(size: ProxySpacing.extraSmall),
        const ProxyTextWidget(
          isUnderline: true,
          color: ThemeColors.skin,
          fontWeight: ProxyFontWeight.bold,
          text: 'Edit',
        ),
      ],
    );
  }
}
