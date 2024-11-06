import 'package:flutter/material.dart';
import '/src/core/theming/styles.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyles.font30BlackBold,
      ),
    );
  }
}
