import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/settings.dart';
import 'package:flutter_practise_user_firebase/models/navigation/navigation_item_model.dart';
import 'package:flutter_practise_user_firebase/models/navigation/navigation_params_model.dart';
import 'package:flutter_practise_user_firebase/screens/invalid_route_screen.dart';

class NavigationWidget extends StatelessWidget {
  final String path;
  final NavigationItem? item;
  final NavigationParams? params;

  const NavigationWidget({
    Key? key,
    required this.path,
    this.item,
    this.params,
  }) : super(key: key);

  Widget get _body => item!.body(params);

  PreferredSizeWidget? get _appBar => item!.appBar(params);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Scaffold(
        body: InvalidRouteScreen(
          path: path,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: _appBar,
        resizeToAvoidBottomInset: true,
        body: AnimatedSwitcher(
          switchInCurve: Curves.easeInExpo,
          switchOutCurve: Curves.easeOutExpo,
          duration: SettingsConstants.duration300,
          child: _body,
        ),
      ),
    );
  }
}
