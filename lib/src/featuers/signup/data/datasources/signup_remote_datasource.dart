import 'package:firebase_auth/firebase_auth.dart';
import '../models/signup_model.dart';

abstract class SignupRemoteDatasource {

  Future<UserCredential> createAccountWithEmailPassword(
      {required SignupModel signupModel});

  Future<String> sendVerifedCode(String phoneNumber);
}
