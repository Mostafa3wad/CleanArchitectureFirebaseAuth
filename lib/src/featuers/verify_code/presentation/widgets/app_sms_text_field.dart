import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/core/helper/app_regex.dart';
import '/src/core/theming/colors.dart';
import '/src/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/widgets/spacing.dart';
import '/src/featuers/verify_code/presentation/cubit/verify_code_cubit.dart';

class AppSmsTextField extends StatefulWidget {
  const AppSmsTextField({super.key, required this.smsCode});
  final String smsCode;

  @override
  State<AppSmsTextField> createState() => _AppSmsTextFieldState();
}

class _AppSmsTextFieldState extends State<AppSmsTextField> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  void code() =>
      widget.smsCode !=
      _controllers.map((controller) => controller.text).join();

  bool _isValidated = false;

  @override
  void dispose() {
    for (var i = 0; i < _focusNodes.length - 1; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            6,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: KeyboardListener(
                  focusNode: FocusNode(),
                  onKeyEvent: (event) {
                    // When you press the delete button and the text field is empty ،He takes a step back
                    if (event is KeyDownEvent &&
                        event.logicalKey == LogicalKeyboardKey.backspace &&
                        _controllers[index].text.isEmpty) {
                      FocusScope.of(context)
                          .requestFocus(_focusNodes[index - 1]);
                    }
                  },
                  child: TextFormField(
                    controller: _controllers[index],
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.hasnumber(value)) {
                        _isValidated = true;
                        return '';
                      } else {
                        _isValidated = false;
                        return null;
                      }
                    },
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // for marge controllers to sms code
                      code();
                      // To move back field
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes[index - 1]);
                      }
                      // To move next field
                      if (index != 5 && value.isNotEmpty) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes[index + 1]);
                      } else {}
                    },
                    // clean field when pressed
                    onTap: () => _controllers[index].clear,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.w),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1.3,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsManager.ligtherGray,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: ColorsManager.moreLightGray),
                    obscureText: false,
                    style: TextStyles.font14DarkBlueMedium,
                    maxLength: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        verticalSpace(35),
        if (_isValidated)
          BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
            builder: (context, state) {
              if (state is WrongSendCode) {
                return Column(
                  children: [
                    Text(
                      'Wrong code, please try again',
                      style: TextStyles.font16RedRegular,
                    ),
                    verticalSpace(35),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
      ],
    );
  }
}
