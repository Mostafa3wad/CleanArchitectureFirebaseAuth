import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/failures.dart';
import '/src/core/network/network_info.dart';
import '../datasources/signup_remote_datasource.dart';
import '../models/signup_model.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/signup_repo.dart';

class SignupRepositoryImpl implements SignUpRepo {
  final NetworkInfo networkInfo;
  final SignupRemoteDatasource signupDatasource;

  SignupRepositoryImpl(
      {required this.networkInfo, required this.signupDatasource});
  @override
  Future<Either<Failure, UserCredential>> createAccountWithEmailAndPassword(
      {required SignupEntity signupEntity}) async {
    if (await networkInfo.isConncted) {
      try {
        SignupModel model = SignupModel(
            email: signupEntity.email,
            password: signupEntity.password,
            phoneNumber: signupEntity.phoneNumber);
        final remoteSignUp =
            signupDatasource.createAccountWithEmailPassword(signupModel: model);
        return Right(await remoteSignUp);
      } on FirebaseAuthException catch (e) {
        return Left(WronCreateAccountFailuer(
            error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }

  @override
  Future<Either<Failure, String>> sendVerifedCode(
      {required String phoneNumber}) async {
    if (await networkInfo.isConncted) {
      try {
        final remoteSignUp = signupDatasource.sendVerifedCode(phoneNumber);
        return Right(await remoteSignUp);
      } on FirebaseAuthException catch (e) {
        return Left(WrongSendVerifyCodeFailuer(
            error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }
}
