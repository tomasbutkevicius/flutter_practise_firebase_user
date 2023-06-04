import 'package:flutter_practise_user_firebase/widgets/proxy/dialog/proxy_alert_dialog.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter/material.dart';

class ConfirmationDialogWidget {
  static void show({required String text, required BuildContext context, required VoidCallback onAccept}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ProxyAlertDialog(
        title: text,
        onAccept: () {
          onAccept();
          NavigationUtilities.dismissDialog(context);
        },
        onCancel: () {
          NavigationUtilities.dismissDialog(context);
        },
      ),
    );
  }
}