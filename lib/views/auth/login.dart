import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/auth/forget_password.dart';

import '../../core/ui/app_button_forget.dart';
import '../../core/ui/app_login_or_register.dart';
import '../home/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50.h),
              AppImage(image: "login.png"),
              SizedBox(height: 24.h),
              Text("Welcome To"),
              SizedBox(height: 6.h),
              Text(
                "Tranquility",
                style: TextStyle(
                  fontFamily: "Mystery Quest",
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff284243),
                ),
              ),
              SizedBox(height: 10.h),
              AppInput(label: "Phone Number"),
              AppInput(label: "Password", isPassword: true),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: AppButtonForget(
                  text: "Forget Password?",
                  onPressed: () {
                    goTo(page: ForgetPasswordView(),);
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 56.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Color(0x2842431A).withValues(alpha: .11),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AppImage(image: "finger.svg"),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: AppButton(
                      text: "Log In",
                      onPressed: () {
                        goTo(page: HomeView(),canPop: false);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              AppLoginOrRegister(isLogin: true),

              _Item(
                text: "Login With Google",
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png",
                color: Colors.green.withValues(alpha: .88),
              ),
              SizedBox(height: 10.h),
              _Item(
                text: "Login With Facebook",
                image:
                    "https://static.vecteezy.com/system/resources/previews/018/930/698/non_2x/facebook-logo-facebook-icon-transparent-free-png.png",
                color: Colors.blue.withValues(alpha: .60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String image, text;
  final Color? color;

  const _Item({this.image = "", this.text = "", this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(width: 40.w, height: 40.h, image: image),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              text,

              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
