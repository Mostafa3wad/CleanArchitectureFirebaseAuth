import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/theming/styles.dart';
import '/src/core/widgets/spacing.dart';

Widget buildHeader(
  BuildContext cotext,
) =>
    Container(
      height: 160.w,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
        ),
        color: Colors.red[600],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 70.w,
              height: 70.w,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: const Icon(
                Icons.close_sharp,
                color: Colors.white,
                size: 58,
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            'ERROR',
            style: TextStyles.font12WhiteRegular,
          )
        ],
      ),
    );
