import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/routes.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/login/login_form_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_text_widget.dart';

class LoginWrapperWidget extends StatelessWidget {
  const LoginWrapperWidget({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    NavigationUtilities.push(path: Routes.register, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LocalImageWrapperWidget(
          image: IconsConstants.loginLogo,
          width: 100.0,
          height: 145.0,
        ),
        const LoginFormWidget(),
        ProxyButtonTextWidget(
          onPressed: () => _onPressed(context),
          text: 'Sign up',
          color: ThemeColors.white,
          textColor: ThemeColors.black,
        ),
      ],
    );
  }
}
