import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/failures.dart';
import '/src/featuers/sign_out/data/datasources/sign_out_datasource.dart';
import '/src/featuers/sign_out/domain/repositories/sign_out_repo.dart';

class SignOutRepositoryImpl implements SignOutRepo {
  final SignOutDatasource signOutDatasource;
  SignOutRepositoryImpl({required this.signOutDatasource});
  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      final failureOrRight = signOutDatasource.signOut();
      return Right(await failureOrRight);
    } on FirebaseAuthException catch (e) {
      return Left(SignOutFailure(error: AuthErrorHandler.handleAuthError(e)));
    }
  }
}
