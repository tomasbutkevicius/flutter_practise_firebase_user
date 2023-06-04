import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_practise_user_firebase/models/form/form_login_model.dart';
import 'package:flutter_practise_user_firebase/models/form/form_register_model.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';

class UserRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> login(FormLoginModel formModel) async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
      email: formModel.valueEmail,
      password: formModel.valuePassword,
    );

    return UserModel.fromCredential(credential);
  }

  Future register(FormRegisterModel formModel) async {
    await auth.createUserWithEmailAndPassword(
      email: formModel.valueEmail,
      password: formModel.valuePassword,
    );
  }
}
