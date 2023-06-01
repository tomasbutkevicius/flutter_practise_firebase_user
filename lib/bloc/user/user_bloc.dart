import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_repository.dart';
import 'package:flutter_practise_user_firebase/models/form/form_login_model.dart';
import 'package:flutter_practise_user_firebase/models/form/form_register_model.dart';
import 'package:flutter_practise_user_firebase/models/request/request_status_model.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(const UserState()) {
    on<UserEventLogOut>(_mapEventLogOut);
    on<UserEventLogIn>(_mapEventLogIn);
    on<UserEventRegister>(_mapEventRegister);
  }

  void _mapEventLogOut(UserEventLogOut event, Emitter<UserState> emit) {
    emit(
      const UserState(),
    );
  }

  Future _mapEventLogIn(UserEventLogIn event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.fetching,
      ),
    );
    try {
      UserModel user = await repository.login(event.formModel);

      emit(
        state.copyWith(
          status: RequestStatus.done,
          user: user,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.error(),
        ),
      );
    }
  }

  Future _mapEventRegister(UserEventRegister event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.fetching,
      ),
    );

    emit(
      state.copyWith(
        status: RequestStatus.done,
      ),
    );
  }
}
