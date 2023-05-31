import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/constants/icons.dart';
import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/register/register_form_widget.dart';

class RegisterWrapperWidget extends StatelessWidget {
  const RegisterWrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        LocalImageWrapperWidget(
          image: IconsConstants.registerLogo,
          width: 100.0,
          height: 145.0,
        ),
        RegisterFormWidget(),
      ],
    );
  }
}
