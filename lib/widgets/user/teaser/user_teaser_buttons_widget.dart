import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_text_widget.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/messages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class UserTeaserButtonsWidget extends StatelessWidget {
  const UserTeaserButtonsWidget({Key? key}) : super(key: key);

  void _onLogout(BuildContext context) {
    context.read<UserBloc>().add(UserEventLogOut());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProxyButtonTextWidget(
          color: ThemeColors.white,
          border: Border.all(
            color: ThemeColors.greyBorders,
          ),
          textColor: ThemeColors.greyText,
          onPressed: () {},
          text: MessagesConstants.aboutMe,
        ),
        ProxyButtonTextWidget(
          text: MessagesConstants.logout,
          onPressed: () => _onLogout(context),
        ),
      ],
    );
  }
}
