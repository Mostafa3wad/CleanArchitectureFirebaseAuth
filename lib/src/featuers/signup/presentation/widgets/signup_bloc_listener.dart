import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/routers/routers_names.dart';
import '/src/core/widgets/app_dialog.dart';
import '/src/featuers/signup/presentation/cubit/signup_cubit.dart';
import '/src/featuers/verify_code/domain/entities/user_entity.dart';
import '/src/featuers/verify_code/presentation/pages/verify_code_page.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
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
          } else if (state is SignupSuccess) {
            context.pop();
            context.pushReplacementNamed(RoutersNames.verifyCode,
                arguments: VerifyCodePageArguments(
                    verificationID: state.verificationID,
                    user: UserEntity(
                        name: context.read<SignupCubit>().nameController.text,
                        id: state.userId,
                        phoneNumber:
                            context.read<SignupCubit>().phoneController.text,
                        email: context.read<SignupCubit>().emailController.text,
                        gender: context.read<SignupCubit>().isMale
                            ? Gender.male
                            : Gender.female,
                        userType: context.read<SignupCubit>().isDriver
                            ? UserType.driver
                            : UserType.passenger)));
          }
        },
        child: const SizedBox.shrink());
  }
}
