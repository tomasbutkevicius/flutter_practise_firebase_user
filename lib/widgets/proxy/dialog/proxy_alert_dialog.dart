import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/messages.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_text_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class ProxyAlertDialog extends StatelessWidget {
  final String? title;
  final VoidCallback onCancel;
  final VoidCallback onAccept;
  final EdgeInsetsGeometry padding;
  final bool showCloseButton;

  const ProxyAlertDialog({
    Key? key,
    this.title,
    this.showCloseButton = true,
    this.padding = const EdgeInsets.all(20.0),
    required this.onCancel,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 16,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      content: Container(
        padding: padding,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: ThemeColors.greyInputFill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title != null)
                Column(
                  children: [
                    const ProxySpacingVerticalWidget(),
                    ProxyTextWidget(
                      text: title!,
                      fontSize: ProxyFontSize.large,
                      fontWeight: ProxyFontWeight.semiBold,
                    ),
                    const ProxySpacingVerticalWidget(),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProxyButtonTextWidget(
                    text: MessagesConstants.yes.toUpperCase(),
                    onPressed: onAccept,
                  ),
                  ProxyButtonTextWidget(
                    color: ThemeColors.white,
                    text: MessagesConstants.no.toUpperCase(),
                    textColor: ThemeColors.greyText,
                    border: Border.all(
                      color: ThemeColors.greyBorders,
                    ),
                    onPressed: onCancel,
                  ),
                ],
              ),
              const ProxySpacingVerticalWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
