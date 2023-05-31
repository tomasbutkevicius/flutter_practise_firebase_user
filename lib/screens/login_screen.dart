import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/widgets/login/login_wrapper_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: const LoginWrapperWidget(),
      ),
    );
  }
}
