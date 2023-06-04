import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';

class AppBarLogoWidget extends StatelessWidget {
  const AppBarLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ProxyTextWidget(
        fontSize: ProxyFontSize.extraLarge,
        fontWeight: ProxyFontWeight.bold,
        textAlign: TextAlign.center,
        text: 'Sign In',
      ),
    );
  }
}
