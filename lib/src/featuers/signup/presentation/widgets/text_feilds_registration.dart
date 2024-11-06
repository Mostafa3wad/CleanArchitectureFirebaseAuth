import 'package:flutter/material.dart';
import '/src/core/helper/app_regex.dart';
import '/src/core/widgets/spacing.dart';
import '/src/core/widgets/app_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/signup_cubit.dart';

class TextFeildsRegistration extends StatefulWidget {
  const TextFeildsRegistration({super.key});

  @override
  State<TextFeildsRegistration> createState() => _TextFeildsRegistrationState();
}

class _TextFeildsRegistrationState extends State<TextFeildsRegistration> {
  bool isObscurePass = true;
  bool isObscureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(38),
          AppTextFormField(
            hintText: 'Your username',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isNameValid(value)) {
                return 'Please enter a valid name';
              }
            },
            keyboardType: TextInputType.name,
            label: 'Username',
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email address',
            label: 'Your email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            keyboardType: TextInputType.phone,
            hintText: 'Your phone',
            label: 'Phone Number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            keyboardType: TextInputType.visiblePassword,
            hintText: 'must be 8 characters',
            label: 'Create a password',
            isObscureText: isObscurePass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscurePass = !isObscurePass;
                });
              },
              icon: Icon(
                !isObscurePass
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.black,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              } else if (!AppRegex.hasMinLength(value)) {
                return 'At least 8 characters long';
              }
            },
            controller: context.read<SignupCubit>().passwordController,
          ),
          verticalSpace(18),
        ],
      ),
    );
  }
}
