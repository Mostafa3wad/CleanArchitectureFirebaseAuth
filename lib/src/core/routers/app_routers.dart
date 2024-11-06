import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/featuers/forget_password/presentation/cubit/forget_password_cubit.dart';
import '/src/featuers/forget_password/presentation/pages/forget_password_page.dart';
import '/src/featuers/home/presentation/cubit/home_cubit.dart';
import '/src/featuers/home/presentation/pages/home_page.dart';
import '/di.dart';
import '/src/core/routers/routers_names.dart';
import '../../featuers/verify_code/presentation/cubit/verify_code_cubit.dart';
import '../../featuers/verify_code/presentation/pages/verify_code_page.dart';
import '../../featuers/login/presentation/cubit/login_cubit.dart';
import '../../featuers/login/presentation/pages/login_page.dart';
import '../../featuers/signup/presentation/cubit/signup_cubit.dart';
import '../../featuers/signup/presentation/pages/signup_page.dart';

class AppRouters {
  AppRouters();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersNames.login:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<LoginCubit>(),
                  child: const LoginPage(),
                ));

      case RoutersNames.signUp:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<SignupCubit>(),
                  child: const SignupPage(),
                ));

      case RoutersNames.home:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomePage(),
                ));

      case RoutersNames.verifyCode:
        final args = settings.arguments as VerifyCodePageArguments;
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<VerifyCodeCubit>(),
                  child: VerifyCodePage(arguments: args),
                ));

      case RoutersNames.forgetPassword:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<ForgetPasswordCubit>(),
                  child: const ForgetPasswordPage(),
                ));
    }

    return CupertinoPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => sl<LoginCubit>(),
              child: const LoginPage(),
            ));
  }
}
