import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/widgets/user/user_wrapper_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: const UserWrapperWidget(),
      ),
    );
  }
}
