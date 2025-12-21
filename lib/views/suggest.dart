import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';

import '../core/logic/helper_methods.dart';
import 'home/view.dart';

class Suggest extends StatelessWidget {
  const Suggest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            goTo(page: HomeView(), canPop: false);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Suggestions",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppImage(image: "suggest.png", width: 170.w, height: 170.h),
            SizedBox(height: 16.h),
            Text(
              textAlign: TextAlign.center,
              "Tell Us How We Can Help",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 50.h),
            AppInput(label: "Subject"),
            AppInput(label: "body", isBig: true),
            SizedBox(height: 24.h),
            AppButton(
              text: "Send Message",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Message Sent Successfully"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Future.delayed(Duration(seconds: 3), () {
                  goTo(page: HomeView());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
