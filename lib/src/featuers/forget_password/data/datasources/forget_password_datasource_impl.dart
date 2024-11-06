import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/featuers/forget_password/data/datasources/forget_password_datasource.dart';

class ForgetPasswordDatasourceImpl implements ForgetPasswordDatasource {
  final FirebaseAuth firebaseAuth;

  ForgetPasswordDatasourceImpl({required this.firebaseAuth});
  @override
  Future<Unit> sendResetPasswordMail(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return unit;
  }
}
