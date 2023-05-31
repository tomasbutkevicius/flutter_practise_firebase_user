import 'package:reactive_forms/reactive_forms.dart';

class FormLoginModel {
  static const String fieldNameEmail = 'email';
  static const String fieldNamePassword = 'password';
  final FormGroup form;

  FormLoginModel(this.form);

  factory FormLoginModel.init() {
    return FormLoginModel(
      fb.group({
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

  Map<String, dynamic> toJson() {
    return {
      'email': form.rawValue[fieldNameEmail],
      'password': form.value[fieldNamePassword],
    };
  }
}
