import 'package:flutter_practise_user_firebase/widgets/register/register_socal_media_buttons_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/register/register_sign_in_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/register/register_form_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';
import 'package:flutter_practise_user_firebase/models/request/request_status_model.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/utilities/status_utilities.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/routes.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterWrapperWidget extends StatelessWidget {
  const RegisterWrapperWidget({Key? key}) : super(key: key);

  void _listener(BuildContext context, UserState state) {
    StatusUtilities.handleStatus(context, state.status);
    if (state.status.value == RequestStatusValue.done) {
      NavigationUtilities.goBackTo(path: Routes.login, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocListener<UserBloc, UserState>(
          listener: _listener,
          child: const SizedBox.shrink(),
        ),
        const LocalImageWrapperWidget(
          image: IconsConstants.registerLogo,
          width: 100.0,
          height: 145.0,
        ),
        const RegisterFormWidget(),
        const ProxySpacingVerticalWidget(),
        const ProxyTextWidget(
          textAlign: TextAlign.center,
          fontWeight: ProxyFontWeight.bold,
          color: ThemeColors.greyText,
          text: 'or',
        ),
        const ProxySpacingVerticalWidget(),
        const RegisterSocialMediaButtonsWidget(),
        const ProxySpacingVerticalWidget(size: ProxySpacing.huge),
        const RegisterSignInWidget(),
      ],
    );
  }
}
