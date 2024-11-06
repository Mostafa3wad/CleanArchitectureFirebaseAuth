import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/failures.dart';
import '/src/core/network/network_info.dart';
import '/src/featuers/forget_password/data/datasources/forget_password_datasource.dart';
import '/src/featuers/forget_password/domain/repositories/forget_password_repo.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepo {
  final NetworkInfo networkInfo;
  final ForgetPasswordDatasource forgetPasswordDatasource;

  ForgetPasswordRepositoryImpl(
      {required this.networkInfo, required this.forgetPasswordDatasource});
  @override
  Future<Either<Failure, Unit>> sendResetPassword(
      {required String email}) async {
    if (await networkInfo.isConncted) {
      try {
        final remoteRestePassword =
            forgetPasswordDatasource.sendResetPasswordMail(email);
        return Right(await remoteRestePassword);
      } on FirebaseAuthException catch (e) {
        return Left(
            ForgetPasswordFailuer(error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }
}