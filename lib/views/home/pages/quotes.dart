import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_image.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppImage(
            height: MediaQuery.heightOf(context),
            fit: BoxFit.cover,
            image:
                "https://krasniykarandash.ru/upload/iblock/13c/13c912c7b9f7126741183cd1dd571778.jpg",
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .95),
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              margin: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
              height: 400.h,
              width: double.infinity.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppImage(
                    image: "quotes11.svg",
                    color: Colors.black,
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    "“ The only way to do great work is to love what you do “",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    textAlign: TextAlign.end,
                    "Steve Jobs",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Copy"),
                      AppImage(image: "copy.svg"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
