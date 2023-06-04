import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/constants/styles.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/widgets/app_bar/app_bar_back_button_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackBtn;

  const AppBarWidget({
    super.key,
    this.title,
    this.showBackBtn = false,
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
            !showBackBtn
                ? const Icon(
                    Icons.arrow_back,
                    color: ThemeColors.white,
                  )
                : const AppBarBackButtonWidget(),
            title == null
                ? const Icon(
                    Icons.arrow_back,
                    color: ThemeColors.white,
                  )
                : ProxyTextWidget(
                    fontSize: ProxyFontSize.large,
                    fontWeight: ProxyFontWeight.bold,
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
