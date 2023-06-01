import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/forms/forms_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormLoginModel {
  static const String name = 'login';

  static const String fieldNameEmail = 'email';
  static const String fieldNamePassword = 'password';

  final FormsBloc bloc;
  final FormGroup form;

  FormLoginModel({
    required this.form,
    required this.bloc,
  });

  factory FormLoginModel.fromState(BuildContext context) {
    final FormsBloc bloc = BlocProvider.of<FormsBloc>(context);
    final FormGroup? form = bloc.state.getItem(name);

    return form == null ? FormLoginModel.init(bloc) : FormLoginModel(form: form, bloc: bloc);
  }

  factory FormLoginModel.init(FormsBloc bloc) {
    return FormLoginModel(
      bloc: bloc,
      form: fb.group({
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
      }),
    );
  }

  void persis() => bloc.add(FormsEventSet(name, form));

  Map<String, dynamic> toJson() {
    return {
      'email': form.rawValue[fieldNameEmail],
      'password': form.value[fieldNamePassword],
    };
  }
}
