import 'package:flutter/material.dart';
import '/src/core/theming/styles.dart';
import '/src/core/widgets/app_text_button.dart';
import '/src/core/widgets/page_title.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/signup/presentation/widgets/already_have_account.dart';
import '/src/core/widgets/app_bar.dart';
import '/src/featuers/signup/presentation/widgets/gender_and_user_type.dart';
import '/src/featuers/signup/presentation/widgets/signup_bloc_listener.dart';
import '/src/featuers/signup/presentation/widgets/text_feilds_registration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/signup_entity.dart';
import '../cubit/signup_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 47.w),
          child: Column(
            children: [
              const MyAppBar(),
              verticalSpace(54),
              const PageTitle(title: 'Sign up'),
              const TextFeildsRegistration(),
              const GenderAndUserType(),
              verticalSpace(38),
              const SignupBlocListener(),
              AppTextButton(
                  buttonText: 'Sign up',
                  textStyle: TextStyles.font16WhiteSemiBole,
                  onPressed: () => validateThenDoSignup(context)),
              verticalSpace(40),
              const AlreadyHaveAccountText()
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signUp(
            signupEntity: SignupEntity(
              email: context.read<SignupCubit>().emailController.text,
              password: context.read<SignupCubit>().passwordController.text,
              phoneNumber: context
                  .read<SignupCubit>()
                  .phoneController
                  .text
                  .trim()
                  .toString(),
            ),
          );
    }
  }
}
