import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/firebase_error_model.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/login_with_email_and_password_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginWithEmailAndPasswordUsecase) : super(LoginInitial());
  final LoginWithEmailAndPasswordUsecase _loginWithEmailAndPasswordUsecase;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login(LoginEntity loginEntity) async {
    emit(LoginLoading());
    try {
      final failureOrRight =
          await _loginWithEmailAndPasswordUsecase(loginEntity: loginEntity);
      failureOrRight.fold((failure) => emit(LoginError(failure.error)),
          (right) {
        emit(LoginSuccess(right));
      });
    } on FirebaseAuthException catch (e) {
      emit(LoginError(AuthErrorHandler.handleAuthError(e)));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
