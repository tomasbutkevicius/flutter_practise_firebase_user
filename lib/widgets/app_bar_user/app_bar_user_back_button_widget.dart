import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/widgets/common/confirmation_dialog_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_wrap_widget.dart';

class AppBarUserBackButtonWidget extends StatelessWidget {
  const AppBarUserBackButtonWidget({super.key});

  void onPressed(BuildContext context) {
    ConfirmationDialogWidget.show(
      text: 'Do you want to logout?',
      context: context,
      onAccept: () {
        context.read<UserBloc>().add(UserEventLogOut());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProxyButtonWrapWidget(
      borderColor: null,
      color: null,
      onPressed: () => onPressed(context),
      child: const LocalImageWrapperWidget(
        image: IconsConstants.arrowBack,
        color: ThemeColors.black,
        width: 16,
      ),
    );
  }
}
