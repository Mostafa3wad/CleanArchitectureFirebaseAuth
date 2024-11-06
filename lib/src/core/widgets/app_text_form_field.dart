import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/widgets/spacing.dart';
import '/src/core/theming/colors.dart';
import '/src/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final String hintText;
  final String label;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      required this.label,
      this.focusedBorder,
      this.backgroundColor,
      this.enableBorder,
      required this.hintText,
      this.isObscureText,
      required this.keyboardType, 
      this.suffixIcon,
      this.inputTextStyle,
      this.hintStyle,
      required this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyles.font14GrayRegular,
          ),
        ),
        verticalSpace(4),
        TextFormField(
          controller: controller,
          validator: (vlaue) => validator(vlaue),
          keyboardType: keyboardType,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.w),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(10)),
              enabledBorder: enableBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.ligtherGray,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
              hintText: hintText,
              suffixIcon: suffixIcon ?? suffixIcon,
              filled: true,
              fillColor: backgroundColor ?? ColorsManager.moreLightGray),
          obscureText: isObscureText ?? false,
          style: TextStyles.font14DarkBlueMedium,
        ),
      ],
    );
  }
}
