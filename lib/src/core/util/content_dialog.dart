import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/helper/navigation_extensions.dart';
import '/src/core/theming/styles.dart';

Widget buildContent(BuildContext context, {required String message}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: SizedBox(
        height: 180.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Ooops! .. $message',
              textAlign: TextAlign.center,
              style: TextStyles.font14GrayMedium,
            ),
            TextButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.w),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.red[600],
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                ),
                fixedSize: WidgetStateProperty.all(
                  Size(150.h, 48.h),
                ),
              ),
              onPressed: () => context.pop(),
              child: Text(
                'Try again',
                style: TextStyles.font16WhiteSemiBole,
              ),
            )
          ],
        ),
      ),
    );
