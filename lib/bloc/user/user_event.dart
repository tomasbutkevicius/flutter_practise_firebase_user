part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
  const UserEvent();
}

@immutable
class UserEventLogIn extends UserEvent {
  final FormLoginModel formModel;

  const UserEventLogIn(this.formModel);
}

@immutable
class UserEventRegister extends UserEvent {
  final FormRegisterModel formModel;

  const UserEventRegister(this.formModel);
}

@immutable
class UserEventLogOut extends UserEvent {}
