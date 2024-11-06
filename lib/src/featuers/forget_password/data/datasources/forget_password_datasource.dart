import 'package:dartz/dartz.dart';

abstract class ForgetPasswordDatasource {
  Future<Unit> sendResetPasswordMail(String email);
}
