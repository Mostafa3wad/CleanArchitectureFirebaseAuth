import 'package:dartz/dartz.dart';
import '/src/core/errors/failures.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, Unit>> sendResetPassword({required String email});
}
