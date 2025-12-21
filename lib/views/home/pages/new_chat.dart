import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/home/view.dart';

class NewChat extends StatelessWidget {
  const NewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withValues(alpha: .10),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
            width: 430,
            color: Colors.grey.withValues(alpha: .10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60.h),
                AppImage(image: "new_chat.png", width: 157.w, height: 157.h),
                Center(
                  child: Text(
                    "Hey!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "I’am your Personal Assistent",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 48.h),
                Text(
                  textAlign: TextAlign.start,
                  "Make New Chat",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                AppInput(label: "Enter The Title Of Chat"),
                SizedBox(height: 24.h),
                AppButton(
                  text: "Start Chat",
                  onPressed: () {
                    goTo(page: HomeView());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
