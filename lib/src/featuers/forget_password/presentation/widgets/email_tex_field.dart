import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/helper/app_regex.dart';
import '/src/core/widgets/app_text_form_field.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/forget_password/presentation/cubit/forget_password_cubit.dart';

class EmailTexField extends StatelessWidget {
  const EmailTexField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),
        Form(
          key: context.read<ForgetPasswordCubit>().formKey,
          child: AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            label: 'Emial address',
            hintText: 'Enter your email address',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
        ),
        verticalSpace(38),
      ],
    );
  }
}
