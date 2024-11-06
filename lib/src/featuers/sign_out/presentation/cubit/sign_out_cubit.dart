import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/src/core/errors/error_handler.dart';
import '/src/core/errors/firebase_error_model.dart';
import '/src/featuers/sign_out/domain/usecases/sign_out_usecase.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.signOutUsecase) : super(SignOutInitial());
  final SignOutUsecase signOutUsecase;

  Future<void> signOut() async {
    try {
      emit(SignOutLoading());
      final failureOrRight = await signOutUsecase();
      failureOrRight.fold((failuer) => emit(SignOutError(error: failuer.error)),
          (right) => emit(SignOutSuccess()));
    } on FirebaseAuthException catch (e) {
      emit(SignOutError(error: AuthErrorHandler.handleAuthError(e)));
    }
  }
}
