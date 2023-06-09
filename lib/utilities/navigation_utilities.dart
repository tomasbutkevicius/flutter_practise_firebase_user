import 'package:flutter_practise_user_firebase/models/navigation/navigation_params_model.dart';
import 'package:flutter_practise_user_firebase/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class NavigationUtilities {
  static void reset(BuildContext context) => context.read<NavigationBloc>().add(NavigationEventReset());

  static void goBack(BuildContext context) => context.read<NavigationBloc>().add(NavigationEventGoBack());

  static void goBackTo({required String path, required BuildContext context}) =>
      context.read<NavigationBloc>().add(NavigationEventGoBackTo(path));

  static void push({required String path, required BuildContext context, NavigationParams? params}) =>
      context.read<NavigationBloc>().add(NavigationEventPush(path, params: params));

  static void replace({required String path, required BuildContext context, NavigationParams? params}) =>
      context.read<NavigationBloc>().add(NavigationEventReplace(path, params: params));

  static void dismissDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
