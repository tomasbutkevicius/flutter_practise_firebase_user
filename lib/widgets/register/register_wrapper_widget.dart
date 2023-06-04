import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/constants/routes.dart';
import 'package:flutter_practise_user_firebase/models/request/request_status_model.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';
import 'package:flutter_practise_user_firebase/utilities/status_utilities.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/register/register_form_widget.dart';

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
      ],
    );
  }
}
