import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}
