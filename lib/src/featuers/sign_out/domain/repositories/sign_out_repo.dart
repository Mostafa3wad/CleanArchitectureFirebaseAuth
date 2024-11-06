import 'package:dartz/dartz.dart';
import '/src/core/errors/failures.dart';

abstract class SignOutRepo {
  Future<Either<Failure, Unit>> signOut();
}
