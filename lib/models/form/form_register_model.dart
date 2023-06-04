import 'package:flutter_practise_user_firebase/bloc/forms/forms_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FormRegisterModel {
  static const String name = 'register';

  static const String fieldNameEmail = 'email';
  static const String fieldNamePassword = 'password';
  static const String fieldNamePasswordConfirmation = 'passwordConfirmation';

  final FormsBloc bloc;
  final FormGroup form;

  const FormRegisterModel({
    required this.bloc,
    required this.form,
  });

  factory FormRegisterModel.fromState(BuildContext context) {
    final FormsBloc bloc = BlocProvider.of<FormsBloc>(context);
    final FormGroup? form = bloc.state.getItem(name);

    return form == null ? FormRegisterModel.init(bloc) : FormRegisterModel(form: form, bloc: bloc);
  }

  factory FormRegisterModel.init(FormsBloc bloc) {
    return FormRegisterModel(
      bloc: bloc,
      form: fb.group(
        {
          fieldNameEmail: FormControl<String>(
            validators: [
              Validators.email,
              Validators.required,
            ],
          ),
          fieldNamePassword: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
        },
      )
        ..addAll(
          {
            fieldNamePasswordConfirmation: FormControl<String>(),
          },
        )
        ..setValidators(
          [
            Validators.mustMatch(fieldNamePassword, fieldNamePasswordConfirmation),
          ],
        ),
    );
  }

  void persis() => bloc.add(FormsEventSet(name, form));

  String get valueEmail => form.control(fieldNameEmail).value as String;

  String get valuePassword => form.control(fieldNamePassword).value as String;
}
