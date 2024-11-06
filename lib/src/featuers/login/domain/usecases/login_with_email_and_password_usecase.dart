import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/failures.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repo.dart';

class LoginWithEmailAndPasswordUsecase {
  final LoginRepo loginRepo;

  LoginWithEmailAndPasswordUsecase(this.loginRepo);

  Future<Either<Failure, UserCredential>> call(
      {required LoginEntity loginEntity}) async {
    return await loginRepo.login(loginEntity);
  }
}
