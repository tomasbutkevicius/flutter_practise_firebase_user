import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:flutter_practise_user_firebase/widgets/user/user_details_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/user/user_teaser_details_widget.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;

  const UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: UserTeaserDetailsWidget(user: user),
          ),
        ),
        Flexible(
          flex: 95,
          child: UserDetailsWidget(user: user),
        ),
      ],
    );
  }
}
