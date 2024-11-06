part of 'sign_out_cubit.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

class SignOutInitial extends SignOutState {}

class SignOutSuccess extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutError extends SignOutState {
  final ErrorModel error;
  const SignOutError({required this.error});
}
