import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/routers/routers_names.dart';
import '/src/core/util/snackbar_message.dart';
import '/src/core/widgets/app_dialog.dart';
import '/src/featuers/signup/presentation/cubit/signup_cubit.dart';
import '/src/featuers/verify_code/domain/entities/user_entity.dart';
import '/src/featuers/verify_code/presentation/cubit/verify_code_cubit.dart';
import '/src/featuers/verify_code/presentation/pages/verify_code_page.dart';

class VerifyCodeBlocListener extends StatelessWidget {
  const VerifyCodeBlocListener({super.key, required this.arguments});
  final VerifyCodePageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCodeCubit, VerifyCodeState>(
        listener: (context, state) {
          if (state is VerifyCodeError) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) =>
                    AppErrorDialog(message: state.error.message));
          } else if (state is WrongSendCode) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) =>
                    AppErrorDialog(message: state.error.message));
          } else if (state is SignupLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
          } else if (state is VerifyCodeSuccess) {
            context.pop();
            SnackBarMessage.showSuccessSnackBar(
                message: 'welcome', context: context);
            context.pushNamed(arguments.user.userType == UserType.driver
                ? RoutersNames.home
                : RoutersNames.home);
          }
        },
        child: const SizedBox.shrink());
  }
}
