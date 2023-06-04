import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_wrap_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter/material.dart';

class AppBarBackButtonWidget extends StatelessWidget {
  const AppBarBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProxyButtonWrapWidget(
      borderColor: null,
      color: null,
      onPressed: () => NavigationUtilities.goBack(context),
      child: const LocalImageWrapperWidget(
        image: IconsConstants.arrowBack,
        color: ThemeColors.greyTextDark,
        width: 16,
      ),
    );
  }
}