import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/core/ui/app_upload_image.dart';
import 'package:tranqulity/views/auth/change_pasword.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Center(child: AppImageUpLoader()),
              SizedBox(height: 34.h),
              AppInput(label: "Name"),
              AppInput(label: "Phone Number"),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 185.w,
                      child: AppInput(label: "Age"),
                    ),
                  ),

                  SizedBox(width: 12.w),
                  Expanded(
                    child: SizedBox(
                      width: 185.w,

                      child: AppInput(label: "Gender"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              AppButton(text: "Save"),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      goTo(page: ChangePassword(),canPop: false);
                    },
                    child: AppImage(image: "edit.svg", color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
