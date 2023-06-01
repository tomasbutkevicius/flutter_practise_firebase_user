import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/forms/forms_bloc.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_practise_user_firebase/utilities/navigation_utilities.dart';

class ListenerUserWidget extends StatelessWidget {
  const ListenerUserWidget({super.key});

  void _listener(BuildContext context, UserState state) {
    NavigationUtilities.reset(context);
    context.read<FormsBloc>().add(FormsEventReset());
  }

  bool _listenWhen(UserState previousState, UserState state) => previousState.user?.email != state.user?.email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: _listener,
      listenWhen: _listenWhen,
      child: const SizedBox.shrink(),
    );
  }
}
