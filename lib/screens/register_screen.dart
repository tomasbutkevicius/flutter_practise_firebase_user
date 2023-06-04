import 'package:flutter_practise_user_firebase/widgets/register/register_wrapper_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: const RegisterWrapperWidget(),
      ),
    );
  }
}
