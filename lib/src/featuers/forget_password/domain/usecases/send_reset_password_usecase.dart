import 'package:dartz/dartz.dart';
import '/src/core/errors/failures.dart';
import '/src/featuers/forget_password/domain/repositories/forget_password_repo.dart';

class SendResetPasswordUsecase {
  final ForgetPasswordRepo repo;

  SendResetPasswordUsecase({required this.repo});

  Future<Either<Failure, Unit>> call(String email) =>
      repo.sendResetPassword(email: email);
}
