import 'login_remote_datasource.dart';
import '../../models/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final FirebaseAuth _firebaseAuth;

  LoginRemoteDatasourceImpl(this._firebaseAuth);

  @override
  Future<UserCredential> login({required LoginModel loginModel}) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: loginModel.email!,
      password: loginModel.password!,
    );
    return userCredential;
  }
}
