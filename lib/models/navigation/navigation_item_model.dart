import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class NavigationItem extends Equatable {
  final bool userRequired;
  final dynamic body;
  final dynamic appBar;

  const NavigationItem({
    this.userRequired = false,
    required this.body,
    required this.appBar,
  });

  @override
  List<Object> get props => [body, appBar, userRequired];
}
