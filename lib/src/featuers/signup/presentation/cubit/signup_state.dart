// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String verificationID;
  final String userId;
  const SignupSuccess({
    required this.verificationID,
    required this.userId,
  });
}

class CreatedAccountSuccess extends SignupState {}

class SignupError extends SignupState {
  final ErrorModel error;

  const SignupError(this.error);
}
