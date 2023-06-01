part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final RequestStatus status;
  final UserModel? user;

  const UserState({
    this.status = const RequestStatus(value: RequestStatusValue.init),
    this.user,
  });

  UserState copyWith({
    RequestStatus? status,
    UserModel? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  bool get isLoggedIn => user != null;

  @override
  List<Object?> get props => [status, user];
}
