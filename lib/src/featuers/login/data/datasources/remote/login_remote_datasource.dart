import 'package:firebase_auth/firebase_auth.dart';
import '../../models/login_model.dart';

abstract class LoginRemoteDatasource {
  Future<UserCredential> login({required LoginModel loginModel});
}
