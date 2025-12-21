import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_picker.dart';
import 'package:image_picker/image_picker.dart';


class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppImage(image: "forget_password.png", bottomSpace: 24),

            Text(
              "Create New Password",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            SizedBox(height: 16.h),
            Text(
              "create your new password to log in !",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 34.h),
            AppInput(label: "Password", bottomSpace: 34, isPassword: true),
            AppInput(label: "Confirm Password", bottomSpace: 34, isPassword: true,),
            SizedBox(height: 50.h,),
            AppButton(text: "Confirm"),
          ],
        ),
      ),
    );
  }
}
