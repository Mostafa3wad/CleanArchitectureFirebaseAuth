import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyles.font14GrayRegular,
          ),
          TextSpan(
            text: 'Log in',
            style: TextStyles.font14BlackSemiBlod,
            recognizer: TapGestureRecognizer()..onTap = () => context.pop(),
          ),
        ],
      ),
    );
  }
}
