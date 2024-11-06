import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/failures.dart';
import '../entities/signup_entity.dart';
import '../repositories/signup_repo.dart';

class CreateAccountWithEmailAndPasswordUsecase {
  SignUpRepo signUpRepo;
  CreateAccountWithEmailAndPasswordUsecase({required this.signUpRepo});

  Future<Either<Failure, UserCredential>> call(
      {required SignupEntity signupEntity}) async {
    return await signUpRepo.createAccountWithEmailAndPassword(
        signupEntity: signupEntity);
  }
}
