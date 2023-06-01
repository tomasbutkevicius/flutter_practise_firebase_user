import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/constants/styles.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/widgets/app_bar_user/app_bar_user_back_button_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class AppBarUserWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const AppBarUserWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.white,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 30.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppBarUserBackButtonWidget(),
            title == null
                ? const Icon(
                    Icons.arrow_back,
                    color: ThemeColors.white,
                  )
                : ProxyTextWidget(
                    fontSize: ProxyFontSize.extraLarge,
                    fontWeight: ProxyFontWeight.extraBold,
                    textAlign: TextAlign.center,
                    text: title!,
                  ),
            const LocalImageWrapperWidget(
              image: IconsConstants.menu,
              width: 18,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(StylesConstants.heightAppBar);
}
