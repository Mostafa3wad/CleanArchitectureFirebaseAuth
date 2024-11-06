import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/src/core/helper/app_regex.dart';
import '/src/core/widgets/app_text_form_field.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/login/presentation/cubit/login_cubit.dart';

class EmailAndPasswordwidget extends StatefulWidget {
  const EmailAndPasswordwidget({super.key});

  @override
  State<EmailAndPasswordwidget> createState() => _EmailAndPasswordwidgetState();
}

class _EmailAndPasswordwidgetState extends State<EmailAndPasswordwidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
                label: 'Email address',
                hintText: 'Your email',
                keyboardType: TextInputType.emailAddress,
                controller: context.read<LoginCubit>().email,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(
                          context.read<LoginCubit>().email.text)) {
                    return 'Please enter a valid name';
                  }
                }),
            verticalSpace(20),
            AppTextFormField(
                label: 'Password',
                hintText: 'Your Password',
                controller: context.read<LoginCubit>().password,
                keyboardType: TextInputType.visiblePassword,
                isObscureText: isObscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: Icon(
                    isObscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  } else if (value.length <= 7) {
                    return 'At least 8 characters long';
                  }
                }),
          ],
        ));
  }
}
