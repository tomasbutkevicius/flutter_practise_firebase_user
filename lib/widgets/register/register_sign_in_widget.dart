import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/routes.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter/material.dart';

class RegisterSignInWidget extends StatelessWidget {
  const RegisterSignInWidget({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    NavigationUtilities.goBackTo(path: Routes.login, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ProxyTextWidget(
          color: ThemeColors.greyText,
          text: 'Already have an account? ',
        ),
        InkWell(
          onTap: () => _onPressed(context),
          child: const ProxyTextWidget(
            color: ThemeColors.skin,
            isUnderline: true,
            fontWeight: ProxyFontWeight.bold,
            text: 'Sign In',
          ),
        )
      ],
    );
  }
}
