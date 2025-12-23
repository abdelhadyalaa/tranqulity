import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/views/home/view.dart';

import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),

      body: Form(
        key: formKey,

        child: SingleChildScrollView(
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
              AppInput(
                label: "Confirm New Password",
                bottomSpace: 60,
                isPassword: true,
              ),
              AppButton(
                text: "Change Password",
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    goTo(page: HomeView(), canPop: false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sorry You Should Put Your Data ...."),
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
