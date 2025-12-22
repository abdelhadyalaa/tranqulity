import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/logic/helper_methods.dart';
import '../core/ui/app_image.dart';
import 'auth/login.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final list = [
    _Model(
      image: "boarding_one.png",
      title: "Feel Free",
      desc:
          "because I'm the friendly chatbot \nhere to assist you with anything you need.",
    ),
    _Model(
      image: "boarding_two.png",
      title: "Ask For Anything",
      desc:
          "I'm your friendly neighborhood \nchatbot ready to assist you with \nany questions or concerns.",
    ),
    _Model(
      image: "boarding_three.png",
      title: "Your Secert is Save",
      desc: "Our platform prioritizes your privacy and security",
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLast = currentIndex == list.length - 1;
    final currentModel = list[currentIndex];
    void goToLogin() {
      goTo(page: LoginView());
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(
                image: currentModel.image,
                width: double.infinity.w,
                height: 560.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.0),
                child: Text(
                  currentModel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.0),
                child: Text(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22.sp,
                  ),
                  currentModel.desc,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  isLast
                      ? SizedBox.shrink()
                      : TextButton(
                          onPressed: () {
                            goToLogin();
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 20.0),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff434C6D),
                              ),
                            ),
                          ),
                        ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 20.0),
                    child: FloatingActionButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: AppImage(image: "forward.svg"),

                      onPressed: () {


                        isLast?goToLogin():currentIndex++;

                        setState(() {});
                      },
                    ),
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

class _Model {
  final String image, title, desc;

  _Model({required this.image, required this.title, required this.desc});
}
