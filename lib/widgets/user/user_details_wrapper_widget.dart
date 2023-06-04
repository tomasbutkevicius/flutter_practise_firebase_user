import 'package:flutter_practise_user_firebase/widgets/user/details/user_details_widget.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class UserDetailsWrapperWidget extends StatelessWidget {
  final UserModel user;

  const UserDetailsWrapperWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      decoration: const BoxDecoration(
        color: ThemeColors.greyTextDark,
      ),
      child: UserDetailsWidget(user: user),
    );
  }
}
