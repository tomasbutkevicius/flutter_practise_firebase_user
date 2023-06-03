import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/messages.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/user/user_details_item_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserModel user;

  const UserDetailsWidget({Key? key, required this.user}) : super(key: key);

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProxySpacingVerticalWidget(
              size: ProxySpacing.large,
            ),
            UserDetailsItemWidget(
              iconPath: IconsConstants.phone,
              label: MessagesConstants.phoneNumber,
              value: user.phone,
            ),
            UserDetailsItemWidget(
              iconPath: IconsConstants.email,
              label: MessagesConstants.email,
              value: user.email,
            ),
            UserDetailsItemWidget(
              iconPath: IconsConstants.circleProject,
              label: MessagesConstants.completedProjects,
              value: user.completedProjects.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
