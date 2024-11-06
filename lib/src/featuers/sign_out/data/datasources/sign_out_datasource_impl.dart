import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/src/featuers/sign_out/data/datasources/sign_out_datasource.dart';

class SignOutDatasourceImpl implements SignOutDatasource {
  final FirebaseAuth firebaseAuth;

  SignOutDatasourceImpl({required this.firebaseAuth});
  @override
  Future<Unit> signOut() async {
    await firebaseAuth.signOut();
    return unit;
  }
}
