import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/routers/routers_names.dart';
import '/src/core/widgets/app_dialog.dart';
import '/src/featuers/login/presentation/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
          } else if (state is LoginSuccess) {
            context.pop();
            context.pushReplacementNamed(RoutersNames.home);
          } else if (state is LoginError) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) =>
                    AppErrorDialog(message: state.error.message));
          }
        },
        child: const SizedBox.shrink());
  }
}
