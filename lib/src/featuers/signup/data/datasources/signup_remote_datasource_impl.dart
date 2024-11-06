import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_remote_datasource.dart';
import '../models/signup_model.dart';

class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  SignupRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> createAccountWithEmailPassword(
      {required SignupModel signupModel}) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: signupModel.email,
      password: signupModel.password,
    );
    return userCredential;
  }

  @override
  Future<String> sendVerifedCode(String phoneNumber) async {
    Completer<String> completer = Completer<String>();
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(minutes: 2),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verId, int? resendToken) {
        completer.complete(verId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return completer.future;
  }
}
