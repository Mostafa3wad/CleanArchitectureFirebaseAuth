import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/src/core/consent/strings.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/firebase_error_model.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/usecases/create_account_with_email_and_pass_usercase.dart';
import '../../domain/usecases/send_verifed_code_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required CreateAccountWithEmailAndPasswordUsecase createAccountUsercase,
    required SendVerifedCodeUsecase sendVerifedCodeUsecase,
  })  : _sendVerifedCodeUsecase = sendVerifedCodeUsecase,
        _createAccountUsercase = createAccountUsercase,
        super(SignupInitial());
  final CreateAccountWithEmailAndPasswordUsecase _createAccountUsercase;
  final SendVerifedCodeUsecase _sendVerifedCodeUsecase;
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isMale = true;
  bool isDriver = true;

  Future<void> signUp({required SignupEntity signupEntity}) async {
    try {
      UserCredential? userCredential;
      emit(SignupLoading());
      // Create Account with email and password.
      final fialureOrUserCredential =
          await _createAccountUsercase(signupEntity: signupEntity);
      fialureOrUserCredential.fold((failure) {
        emit(SignupError(failure.error));
        throw FirebaseAuthException(code: AppString.createAccountCodeError);
      }, (credential) {
        userCredential = credential;
        emit(CreatedAccountSuccess());
      });
      final fialureOrString =
          await _sendVerifedCodeUsecase(phoneNumber: signupEntity.phoneNumber);
      // send sms code for verify phone number.
      fialureOrString.fold(
          (failure) => emit(SignupError(failure.error)),
          (verificationID) => emit(SignupSuccess(
              verificationID: verificationID,
              userId: userCredential!.user!.uid)));
    } on FirebaseAuthException catch (e) {
      emit(SignupError(AuthErrorHandler.handleAuthError(e)));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
