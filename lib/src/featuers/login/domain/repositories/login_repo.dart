import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/failures.dart';
import '../entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> login(LoginEntity loginEntity);
}
