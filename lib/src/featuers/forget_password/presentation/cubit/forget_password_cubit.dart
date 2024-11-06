import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/firebase_error_model.dart';
import '/src/featuers/forget_password/domain/usecases/send_reset_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.sendResetPasswordUsecase)
      : super(ForgetPasswordInitial());

  TextEditingController emailController = TextEditingController();
  final SendResetPasswordUsecase sendResetPasswordUsecase;
  final formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    emailController
        .dispose(); //TODO make dispose controller in stateFulWidget class to init
    return super.close();
  }

  Future<void> resetPassword() async {
    try {
      emit(ForgetPasswordLoading());
      final failureOrRight =
          await sendResetPasswordUsecase(emailController.text);
      failureOrRight.fold(
        (failure) => emit(ForgetPasswordError(error: failure.error)),
        (right) => emit(ForgetPasswordSuccess()),
      );
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordError(error: AuthErrorHandler.handleAuthError(e)));
    }
  }
}
