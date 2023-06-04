import 'package:flutter_practise_user_firebase/widgets/navigation/navigation_widget.dart';
import 'package:flutter_practise_user_firebase/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/constants/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationWrapperWidget extends StatelessWidget {
  const NavigationWrapperWidget({super.key});

  Future<bool> _onWillPop(BuildContext context, NavigationState state) async {
    if (state.items.length < 2) {
      return true;
    }

    NavigationUtilities.goBack(context);
    return false;
  }

  bool _buildWhenNavigation(NavigationState previousState, NavigationState state) => previousState != state;

  Widget _builderNavigation(BuildContext context, NavigationState state) {
    final NavigationStateItem item = state.items.last;
    return WillPopScope(
      onWillPop: () => _onWillPop(context, state),
      child: NavigationWidget(
        path: item.path,
        params: item.params,
        item: Routes.mapping[item.path],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: _builderNavigation,
      buildWhen: _buildWhenNavigation,
    );
  }
}
