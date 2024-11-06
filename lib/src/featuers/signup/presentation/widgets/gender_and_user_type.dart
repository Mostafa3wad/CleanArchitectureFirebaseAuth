import 'package:flutter/material.dart';
import '/src/core/theming/colors.dart';
import '/src/core/theming/styles.dart';
import '/src/core/widgets/app_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/featuers/signup/presentation/cubit/signup_cubit.dart';

class GenderAndUserType extends StatefulWidget {
  const GenderAndUserType({super.key});

  @override
  State<GenderAndUserType> createState() => _GenderAndUserTypeState();
}

class _GenderAndUserTypeState extends State<GenderAndUserType> {
  bool isMale = true;

  bool isDriver = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Driver',
              style: isDriver
                  ? TextStyles.font12GrayRegular
                  : TextStyles.font12BlckMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AppSwitch(
                value: isDriver,
                onChanged: (value) {
                  setState(() {
                    isDriver = context.read<SignupCubit>().isDriver;
                    isDriver = !value;
                  });
                },
                leftColor: ColorsManager.driverColor,
                rightColor: ColorsManager.passengerColor,
              ),
            ),
            Text(
              'Passenger',
              style: !isDriver
                  ? TextStyles.font12GrayRegular
                  : TextStyles.font12BlckMedium,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Female',
              style: isMale
                  ? TextStyles.font12GrayRegular
                  : TextStyles.font12BlckMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AppSwitch(
                isForGender: true,
                value: isMale,
                onChanged: (value) {
                  isMale = context.read<SignupCubit>().isMale;
                  setState(() {
                    isMale = !value;
                  });
                },
                leftColor: ColorsManager.femaleColor,
                rightColor: ColorsManager.maleColor,
              ),
            ),
            Text(
              'Male',
              style: !isMale
                  ? TextStyles.font12GrayRegular
                  : TextStyles.font12BlckMedium,
            ),
          ],
        ),
      ],
    );
  }
}
