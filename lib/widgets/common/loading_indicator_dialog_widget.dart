import 'package:flutter/material.dart';

class LoadingIndicatorDialogWidget {
  final BuildContext context;

  const LoadingIndicatorDialogWidget(this.context);

  void hide() {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  Widget _builder(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }

  void show() {
    showDialog(
      context: context,
      builder: _builder,
      barrierDismissible: false,
    );
  }
}
