import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_practise_user_firebase/theme/theme.dart';
import 'package:flutter_practise_user_firebase/widgets/navigation/navigation_wrapper_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: Stack(
        children: const [NavigationWrapperWidget()],
      ),
    );
  }
}
