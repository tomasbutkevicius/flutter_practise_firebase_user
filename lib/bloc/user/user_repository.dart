import 'package:dio/dio.dart';
import 'package:flutter_practise_user_firebase/models/form/form_login_model.dart';
import 'package:flutter_practise_user_firebase/models/form/form_register_model.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';

class UserRepository {
  Future<UserModel> login(FormLoginModel formModel) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => UserModel(
        email: formModel.form.value[FormLoginModel.fieldNameEmail] as String,
        username: 'Username',
        completedProjects: 0,
        phone: 'phone',
        city: 'New York',
        id: '112061',
      ),
    );
  }

  Future register(FormRegisterModel formModel) async {}
}
