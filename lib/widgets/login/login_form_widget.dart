import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:flutter_practise_user_firebase/models/form/form_login_model.dart';
import 'package:flutter_practise_user_firebase/widgets/input/input_text_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_text_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late final FormLoginModel _formModel;

  @override
  void initState() {
    super.initState();
    _formModel = FormLoginModel.fromState(context);
  }

  @override
  void dispose() {
    _formModel.persis();
    super.dispose();
  }

  void _onSubmitted() {
    FocusManager.instance.primaryFocus!.unfocus();
    if (_formModel.form.valid) {
      context.read<UserBloc>().add(UserEventLogIn(_formModel));
    } else {
      _formModel.form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _formModel.form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ProxySpacingVerticalWidget(
            size: ProxySpacing.large,
          ),
          const InputTextWidget(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            formControlName: FormLoginModel.fieldNameEmail,
          ),
          const ProxySpacingVerticalWidget(),
          InputTextWidget(
            obscureText: true,
            onSubmitted: _onSubmitted,
            label: 'Password',
            textInputAction: TextInputAction.done,
            formControlName: FormLoginModel.fieldNamePassword,
          ),
          const ProxySpacingVerticalWidget(),
          ProxyButtonTextWidget(onPressed: _onSubmitted, text: 'Login'),
        ],
      ),
    );
  }
}
