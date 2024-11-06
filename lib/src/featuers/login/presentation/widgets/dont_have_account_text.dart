import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/theming/styles.dart';
import '/src/core/routers/routers_names.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
            TextSpan(
            text: 'Don’t have an account? ',
            style: TextStyles.font14GrayRegular,
          ),
          TextSpan(
            text: ' Sign up',
            style:   TextStyles.font14BlackSemiBlod,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(RoutersNames.signUp);
              },
          ),
        ],
      ),
    );
  }
}
