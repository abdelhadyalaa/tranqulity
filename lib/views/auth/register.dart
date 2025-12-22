import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/home/view.dart';

import '../../core/ui/app_login_or_register.dart';
import '../../core/ui/app_upload_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: AppImageUpLoader()),
              SizedBox(height: 40.h),
              AppInput(label: "Username", bottomSpace: 16),
              AppInput(label: "Phone Number", bottomSpace: 16),
              AppInput(label: "Age", bottomSpace: 16),
              AppInput(label: "Gender", bottomSpace: 16),
              AppInput(label: "Password", bottomSpace: 16, isPassword: true),
              AppInput(
                label: "Confirm Password",
                bottomSpace: 16,
                isPassword: true,
              ),
              AppButton(text: "Sign Up",
              onPressed: () {
                goTo(page: HomeView());
              },),
              AppLoginOrRegister(isLogin: false),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
