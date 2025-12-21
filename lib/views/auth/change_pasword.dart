import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/views/home/view.dart';

import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
              "Change Your Password",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            SizedBox(height: 24.h),

            AppInput(label: "Old Password", isPassword: true),
            AppInput(label: "New Password", isPassword: true),
            AppInput(label: "Confirm New Password", bottomSpace: 60, isPassword: true),
            AppButton(
              text: "Change Password",
              onPressed: () {
                goTo(page: HomeView(), canPop: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
