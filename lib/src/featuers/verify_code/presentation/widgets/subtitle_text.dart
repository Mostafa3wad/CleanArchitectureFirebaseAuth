import 'package:flutter/material.dart';
import '/src/core/theming/styles.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'We’ve sent an SMS with an activation code to your phone ',
            style: TextStyles.font14GrayRegular,
          ),
          TextSpan(
            text: phoneNumber,
            style: TextStyles.font14BlackSemiBlod,
          ),
        ],
      ),
    );
  }
}
