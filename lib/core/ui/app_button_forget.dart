import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonForget extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLogout;

  const AppButtonForget({
    super.key,
    this.text = "",
    this.onPressed,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: TextButton.styleFrom(),
      child: Text(
        text!,
        style: TextStyle(
          color: isLogout ? Colors.red : Theme.of(context).primaryColor,
          decorationColor: isLogout ? Colors.red : Theme.of(context).primaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
