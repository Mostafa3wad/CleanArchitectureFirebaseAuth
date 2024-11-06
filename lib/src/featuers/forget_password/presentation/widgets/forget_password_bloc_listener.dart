import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/util/snackbar_message.dart';
import '/src/core/widgets/app_dialog.dart';
import '/src/featuers/forget_password/presentation/cubit/forget_password_cubit.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoading) {
            SnackBarMessage.showSuccessSnackBar(message: '', context: context);
          } else if (state is ForgetPasswordError) {
            showDialog(
                context: context,
                builder: (context) => AppErrorDialog(message: state.error.message));
          } else if (state is ForgetPasswordSuccess) {
            SnackBarMessage.showSuccessSnackBar(
                message:
                    'Check your email .. we have sent a instrucrtions to recover your password to your email.',
                context: context);
            context.pop();
          }
        },
        child: const SizedBox.shrink());
  }
}
