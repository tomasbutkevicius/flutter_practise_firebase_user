import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String email;
  final String username;
  final int completedProjects;
  final String phone;
  final String city;
  final String id;

  const UserModel({
    required this.email,
    required this.username,
    required this.completedProjects,
    required this.phone,
    required this.city,
    required this.id,
  });

  factory UserModel.fromCredential(UserCredential credential) {
    return UserModel(
      email: credential.user!.email!,
      username: 'Username',
      completedProjects: 248,
      phone: '+3788888888',
      city: 'New York',
      id: '112061',
    );
  }

  @override
  List<Object?> get props => [
        email,
        username,
        completedProjects,
        phone,
        city,
        id,
      ];
}
