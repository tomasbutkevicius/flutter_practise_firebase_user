import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/messages.dart';

enum RequestStatusValue { fetching, error, done, init }

@immutable
class RequestStatus extends Equatable {
  final String? message;
  final RequestStatusValue value;

  const RequestStatus({
    this.message,
    this.value = RequestStatusValue.init,
  });

  factory RequestStatus.error({
    String message = MessagesConstants.anErrorHasOccurred,
  }) {
    return RequestStatus(
      message: message,
      value: RequestStatusValue.error,
    );
  }

  factory RequestStatus.errorFirebase(FirebaseException exception) {
    return RequestStatus(
      message: exception.message ?? MessagesConstants.anErrorHasOccurred,
      value: RequestStatusValue.error,
    );
  }

  @override
  List<Object?> get props => [message, value];

  static const init = RequestStatus();
  static const done = RequestStatus(value: RequestStatusValue.done);
  static const fetching = RequestStatus(value: RequestStatusValue.fetching);
}
