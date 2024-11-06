import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/sign_out_cubit.dart';

class SignOutButtonWidget extends StatelessWidget {
  const SignOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<SignOutCubit>(),
      child: const Text(
        'Sign out',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
