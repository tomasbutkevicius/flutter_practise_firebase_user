import 'package:flutter_practise_user_firebase/models/navigation/navigation_item_model.dart';
import 'package:flutter_practise_user_firebase/screens/login_screen.dart';
import 'package:flutter_practise_user_firebase/screens/register_screen.dart';
import 'package:flutter_practise_user_firebase/widgets/app_bar/app_bar_widget.dart';

class Routes {
  static const String home = '/';
  static const String register = '/register';

  static Map<String, NavigationItem> mapping = {
    Routes.home: NavigationItem(
      body: (_) => const LoginScreen(),
      appBar: (_) => const AppBarWidget(
        title: 'Sign In',
      ),
    ),
    Routes.register: NavigationItem(
      body: (_) => const RegisterScreen(),
      appBar: (_) => const AppBarWidget(
        title: 'Sign Up',
        showBackBtn: true,
      ),
    ),
  };
}
