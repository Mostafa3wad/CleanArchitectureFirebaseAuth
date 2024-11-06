import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/theming/styles.dart';
import '/src/core/widgets/app_bar.dart';
import '/src/core/widgets/app_text_button.dart';
import '/src/core/widgets/page_title.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/verify_code/domain/entities/user_entity.dart';
import '/src/featuers/verify_code/presentation/cubit/verify_code_cubit.dart';
import '/src/featuers/verify_code/presentation/widgets/app_sms_text_field.dart';
import '/src/featuers/verify_code/presentation/widgets/resend_code_text.dart';
import '/src/featuers/verify_code/presentation/widgets/subtitle_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/featuers/verify_code/presentation/widgets/verify_code_bloc_listener.dart';

class VerifyCodePageArguments {
  final UserEntity user;
  final String verificationID;

  VerifyCodePageArguments({required this.user, required this.verificationID});
}

class VerifyCodePage extends StatelessWidget {
  final VerifyCodePageArguments arguments;
  const VerifyCodePage({super.key, required this.arguments});

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
              const PageTitle(title: 'Enter code'),
              verticalSpace(13),
              SubtitleText(phoneNumber: arguments.user.phoneNumber),
              verticalSpace(35),
              AppSmsTextField(
                smsCode: context.read<VerifyCodeCubit>().smsCodeController.text,
              ),
              ResendCodeText(
                phoneNumber: arguments.user.phoneNumber,
              ),
              verticalSpace(35),
              VerifyCodeBlocListener(arguments: arguments),
              AppTextButton(
                buttonText: 'Verify',
                textStyle: TextStyles.font16WhiteSemiBole,
                onPressed: () => validateThenDoVerifyCode(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoVerifyCode(BuildContext context) async {
    await context.read<VerifyCodeCubit>().createAccount(
        user: arguments.user,
        verificationID: arguments.verificationID,
        smsCode: context.read<VerifyCodeCubit>().smsCodeController.text);
  }
}
