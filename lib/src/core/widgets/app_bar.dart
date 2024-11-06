import 'package:flutter/material.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/theming/colors.dart';
import '/src/core/widgets/logo_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 39.w,
          height: 39.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorsManager.lightGray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        const LogoIcon(),
      ],
    );
  }
}
