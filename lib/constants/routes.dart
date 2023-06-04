import 'package:flutter_practise_user_firebase/models/navigation/navigation_item_model.dart';
import 'package:flutter_practise_user_firebase/widgets/app_bar_user/app_bar_user_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_practise_user_firebase/screens/register_screen.dart';
import 'package:flutter_practise_user_firebase/screens/login_screen.dart';
import 'package:flutter_practise_user_firebase/screens/user_screen.dart';

class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';

  static Map<String, NavigationItem> mapping = {
    Routes.login: NavigationItem(
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
    Routes.user: NavigationItem(
      userRequired: true,
      body: (_) => const UserScreen(),
      appBar: (_) => const AppBarUserWidget(),
    ),
  };
}
