import 'package:flutter_practise_user_firebase/widgets/user/teaser/user_teaser_buttons_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/user/teaser/user_teaser_widget.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UserTeaserWrapperWidget extends StatelessWidget {
  final UserModel user;

  const UserTeaserWrapperWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserTeaserWidget(user: user),
        const ProxySpacingVerticalWidget(),
        const UserTeaserButtonsWidget(),
      ],
    );
  }
}
