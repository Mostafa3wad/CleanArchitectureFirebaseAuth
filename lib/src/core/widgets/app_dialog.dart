import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/util/content_dialog.dart';
import '/src/core/util/header_dialog.dart';

class AppErrorDialog extends StatelessWidget {
  const AppErrorDialog({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.h)),
      child: SizedBox(
        width: 300.w,
        height: 340.w,
        child: Column(
          children: [
            buildHeader(context),
            buildContent(context, message: message),
          ],
        ),
      ),
    );
  }
}
