import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/failures.dart';
import '/src/core/network/network_info.dart';
import '../datasources/remote/login_remote_datasource.dart';
import '../models/login_model.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repo.dart';

class LoginRepositoryImpl extends LoginRepo {
  final LoginRemoteDatasource loginDatasource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.loginDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, UserCredential>> login(LoginEntity loginEntity) async {
    if (await networkInfo.isConncted) {
      try {
        final remoteLogin = loginDatasource.login(loginModel:  LoginModel(
            email: loginEntity.email, password: loginEntity.password));
        return Right(await remoteLogin);
      } on FirebaseAuthException catch (e) {
        return Left(
            WrongLoginFailuer(error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }
}
