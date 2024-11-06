import 'package:flutter/material.dart';
import '/src/core/theming/styles.dart';
import '/src/core/widgets/app_bar.dart';
import '/src/core/widgets/app_text_button.dart';
import '/src/core/widgets/page_title.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/featuers/forget_password/presentation/widgets/email_tex_field.dart';
import '/src/featuers/forget_password/presentation/widgets/forget_password_bloc_listener.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
              const PageTitle(title: 'Enter Email'),
              verticalSpace(13),
              Text(
                'Don’t worry! It happens. Please enter the email associated with your account.',
                style: TextStyles.font14GrayRegular,
              ),
              const EmailTexField(),
              const ForgetPasswordBlocListener(),
              AppTextButton(
                  onPressed: () =>
                      validateThenDoSendResetPasswordEmail(context),
                  buttonText: 'Forget password'),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSendResetPasswordEmail(BuildContext context) async {
    if (context.read<ForgetPasswordCubit>().formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().resetPassword();
    }
  }
}
