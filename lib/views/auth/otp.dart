import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/views/auth/create_new_password.dart';

import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_verify_code.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Form(
        key: formKey,

        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(image: "otp.png", bottomSpace: 24),

              Text(
                "Verification",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
              SizedBox(height: 8.h),
              Text("Please enter the code sent on your \nphone"),
              SizedBox(height: 34.h),
              AppVerifyCode(),
              SizedBox(height: 60.h),

              AppButton(
                text: "Verify",
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    goTo(page: CreateNewPassword(), canPop: false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sorry You Should Put Your Code ...."),
                        backgroundColor: Colors.red.shade800,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
