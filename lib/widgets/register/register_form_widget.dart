import 'package:flutter_practise_user_firebase/widgets/proxy/button/proxy_button_text_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:flutter_practise_user_firebase/models/form/form_register_model.dart';
import 'package:flutter_practise_user_firebase/widgets/input/input_text_widget.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  late final FormRegisterModel _formModel;

  @override
  void initState() {
    super.initState();
    _formModel = FormRegisterModel.fromState(context);
  }

  @override
  void dispose() {
    _formModel.persis();
    super.dispose();
  }

  void _onSubmitted() {
    FocusManager.instance.primaryFocus!.unfocus();
    if (_formModel.form.valid) {
      context.read<UserBloc>().add(UserEventRegister(_formModel));
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
            label: 'Enter email',
            keyboardType: TextInputType.emailAddress,
            formControlName: FormRegisterModel.fieldNameEmail,
          ),
          const ProxySpacingVerticalWidget(),
          InputTextWidget(
            obscureText: true,
            onSubmitted: _onSubmitted,
            label: 'Enter password',
            textInputAction: TextInputAction.done,
            formControlName: FormRegisterModel.fieldNamePassword,
          ),
          const ProxySpacingVerticalWidget(),
          InputTextWidget(
            obscureText: true,
            onSubmitted: _onSubmitted,
            label: 'Confirm password',
            textInputAction: TextInputAction.done,
            formControlName: FormRegisterModel.fieldNamePasswordConfirmation,
          ),
          const ProxySpacingVerticalWidget(),
          ProxyButtonTextWidget(onPressed: _onSubmitted, text: 'Sign Up'),
        ],
      ),
    );
  }
}
