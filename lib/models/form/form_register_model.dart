import 'package:reactive_forms/reactive_forms.dart';

class FormRegisterModel {
  static const String fieldNameEmail = 'email';
  static const String fieldNamePassword = 'password';
  static const String fieldNamePasswordConfirmation = 'passwordConfirmation';

  final FormGroup form = fb.group(
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
    );
}
