import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practise_user_firebase/models/navigation/navigation_params_model.dart';

@immutable
class NavigationItem extends Equatable {
  final bool userRequired;
  final Function(NavigationParams? params) body;
  final Function(NavigationParams? params) appBar;

  const NavigationItem({
    this.userRequired = false,
    required this.body,
    required this.appBar,
  });

  @override
  List<Object> get props => [body, appBar, userRequired];
}
