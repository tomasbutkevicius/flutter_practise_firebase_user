import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/constants/messages.dart';
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

  bool _buildWhen(UserState previousState, UserState state) => previousState.user != state.user;

  Widget _builder(BuildContext context, UserState state) {
    if (!state.isLoggedIn && item!.userRequired) {
      return const Scaffold(
        body: InvalidRouteScreen(
          message: MessagesConstants.loginRequired,
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

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Scaffold(
        body: InvalidRouteScreen(
          message: path,
        ),
      );
    }

    return BlocBuilder<UserBloc, UserState>(
      builder: _builder,
      buildWhen: _buildWhen,
    );
  }
}
