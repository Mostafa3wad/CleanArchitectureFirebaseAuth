import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel({
    required super.email,
    required super.password,
    required super.phoneNumber,
  });
  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber']);
  }
}
