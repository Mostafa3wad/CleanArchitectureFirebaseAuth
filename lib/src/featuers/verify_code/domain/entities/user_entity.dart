import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  final Gender gender;
  final UserType userType;
  const UserEntity(
      {required this.name,
      required this.id,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.userType});

  @override
  List<Object?> get props => [name, email, gender, userType, id, phoneNumber];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'userType': userType.toString().split('.').last,
      'gender': gender.toString().split('.').last
    };
  }
}

enum Gender { male, female }

enum UserType { driver, passenger }
