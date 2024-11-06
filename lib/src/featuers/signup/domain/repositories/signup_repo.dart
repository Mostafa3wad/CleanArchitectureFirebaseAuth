import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/failures.dart';
import '../entities/signup_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserCredential>> createAccountWithEmailAndPassword({
    required SignupEntity signupEntity,
  });

  Future<Either<Failure, String>> sendVerifedCode({required String phoneNumber});
}
