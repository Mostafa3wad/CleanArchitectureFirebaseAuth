import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String email;
  final String password;
  final String phoneNumber;

  const SignupEntity({
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [email, password, phoneNumber];
}
