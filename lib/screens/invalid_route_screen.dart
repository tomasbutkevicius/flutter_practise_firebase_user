import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/messages.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_text_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class InvalidRouteScreen extends StatelessWidget {
  final String message;

  const InvalidRouteScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            ProxyTextWidget(
              fontSize: ProxyFontSize.extraLarge,
              fontWeight: ProxyFontWeight.bold,
              text: '${MessagesConstants.screenNotFound}: $message',
            ),
            const ProxySpacingVerticalWidget(),
            ProxyButtonTextWidget(
              text: MessagesConstants.goBack,
              onPressed: () => NavigationUtilities.reset(context),
            ),
          ],
        ),
      ),
    );
  }
}
