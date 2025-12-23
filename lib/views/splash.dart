import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/logic/helper_methods.dart';
import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goTo(delaySeconds: 5, page: PageOne());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Bounce(
          duration: Duration(seconds: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 360.w,
                    height: 360.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.r),
                      color: Color(0xff284243).withValues(alpha: .15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tranquility",
                          style: TextStyle(
                            fontFamily: "Mystery Quest",
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff284243),
                          ),
                        ),
                        Text(
                          "Together Towards Tranquility",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff284243),
                          ),
                        ),
                      ],
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
