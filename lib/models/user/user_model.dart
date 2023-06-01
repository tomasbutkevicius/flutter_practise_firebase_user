import 'package:equatable/equatable.dart';

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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      username: json['username'],
      completedProjects: json['completedProjects'],
      phone: json['phone'],
      city: json['city'],
      id: json['id'],
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
