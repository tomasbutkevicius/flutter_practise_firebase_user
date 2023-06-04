import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_icon_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter/material.dart';

class LoginSocialMediaButtonsWidget extends StatelessWidget {
  const LoginSocialMediaButtonsWidget({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sorry, not implemented :(, you\'ll need to wait a bit ;)'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProxyButtonIconWidget(
          icon: IconsConstants.facebook,
          onPressed: () => _onPressed(context),
        ),
        const ProxySpacingHorizontalWidget(
          size: ProxySpacing.small,
        ),
        ProxyButtonIconWidget(
          icon: IconsConstants.twitter,
          onPressed: () => _onPressed(context),
        ),
        const ProxySpacingHorizontalWidget(
          size: ProxySpacing.small,
        ),
        ProxyButtonIconWidget(
          icon: IconsConstants.linkedin,
          onPressed: () => _onPressed(context),
        ),
      ],
    );
  }
}