import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/theming/styles.dart';
import '/src/core/widgets/app_text_button.dart';
import '/src/core/widgets/logo_icon.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/login/presentation/widgets/dont_have_account_text.dart';
import '/src/featuers/login/presentation/widgets/email_and_password.dart';
import '/src/core/widgets/page_title.dart';
import '/src/featuers/login/presentation/widgets/login_bloc_listener.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/routers/routers_names.dart';
import '../../domain/entities/login_entity.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 47.w),
          child: Column(
            children: [
              const LogoIcon(),
              verticalSpace(54),
              const PageTitle(title: 'Hi, Welcome!👋'),
              verticalSpace(50),
              const EmailAndPasswordwidget(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => context
                        .pushReplacementNamed(RoutersNames.forgetPassword),
                    child: Text(
                      'Forget password?',
                      style: TextStyles.font14GrayRegular,
                    )),
              ),
              verticalSpace(30),
              const LoginBlocListener(),
              AppTextButton(
                  buttonText: 'Log in',
                  textStyle: TextStyles.font16WhiteSemiBole,
                  onPressed: () => validateThenDoLogin(context)),
              verticalSpace(220),
              const DontHaveAccountText()
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(LoginEntity(
            email: context.read<LoginCubit>().email.text,
            password: context.read<LoginCubit>().password.text,
          ));
    }
  }
}
