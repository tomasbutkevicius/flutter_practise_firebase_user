import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practise_user_firebase/bloc/user/user_repository.dart';
import 'package:flutter_practise_user_firebase/constants/messages.dart';
import 'package:flutter_practise_user_firebase/models/form/form_login_model.dart';
import 'package:flutter_practise_user_firebase/models/form/form_register_model.dart';
import 'package:flutter_practise_user_firebase/models/request/request_status_model.dart';
import 'package:flutter_practise_user_firebase/models/user/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  StreamSubscription<User?>? _listener;

  UserBloc(this.repository) : super(const UserState()) {
    on<UserEventLogOut>(_mapEventLogOut);
    on<UserEventLogIn>(_mapEventLogIn);
    on<UserEventRegister>(_mapEventRegister);
  }

  Future _mapEventLogOut(UserEventLogOut event, Emitter<UserState> emit) async {
    emit(const UserState());
  }

  Future _mapEventLogIn(UserEventLogIn event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.fetching,
      ),
    );
    try {
      UserModel user = await repository.login(event.formModel);

      _handleListener();

      emit(
        state.copyWith(
          status: RequestStatus.done,
          user: user,
        ),
      );
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.errorFirebase(e),
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
    try {
      await repository.register(event.formModel);
      emit(
        state.copyWith(
          status: const RequestStatus(
            value: RequestStatusValue.done,
            message: MessagesConstants.registerSuccess,
          ),
        ),
      );
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.errorFirebase(e),
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

  Future _handleListener() async {
    await _listener?.cancel();
    _listener = repository.auth.authStateChanges().listen(
      (User? firebaseUser) {
        if (firebaseUser == null) {
          add(UserEventLogOut());
        }
      },
    );
  }

  @override
  Future close() async {
    await _listener?.cancel();
    return super.close();
  }
}
