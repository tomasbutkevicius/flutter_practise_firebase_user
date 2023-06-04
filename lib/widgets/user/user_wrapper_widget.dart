import 'package:flutter_practise_user_firebase/widgets/common/loading_indicator_widget.dart';
import 'package:flutter_practise_user_firebase/models/request/request_status_model.dart';
import 'package:flutter_practise_user_firebase/widgets/common/error_icon_widget.dart';
import 'package:flutter_practise_user_firebase/widgets/user/user_widget.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class UserWrapperWidget extends StatelessWidget {
  const UserWrapperWidget({Key? key}) : super(key: key);

  bool _buildWhen(UserState previous, UserState current) {
    return previous != current;
  }

  Widget _builder(BuildContext context, UserState state) {
    if (state.status.value == RequestStatusValue.fetching || state.user == null) {
      return const LoadingIndicatorWidget();
    }

    if (state.status.value == RequestStatusValue.error) {
      return const ErrorIconWidget();
    }

    return UserWidget(user: state.user!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: _builder,
      buildWhen: _buildWhen,
    );
  }
}
