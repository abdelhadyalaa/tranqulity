import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/views/about_us.dart';
import 'package:tranqulity/views/auth/create_new_password.dart';
import 'package:tranqulity/views/auth/forget_password.dart';
import 'package:tranqulity/views/auth/login.dart';
import 'package:tranqulity/views/auth/otp.dart';
import 'package:tranqulity/views/auth/register.dart';
import 'package:tranqulity/views/home/pages/new_chat.dart';
import 'package:tranqulity/views/home/pages/profile.dart';
import 'package:tranqulity/views/home/view.dart';
import 'package:tranqulity/views/on_bording.dart';
import 'package:tranqulity/views/splah.dart';
import 'package:tranqulity/views/suggest.dart';

import 'core/logic/helper_methods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xffFFFFFF),
            elevation: 0,
          ),
          primaryColor: Color(0xff284243),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff284243),
          ),
          fontFamily: 'Inter',
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D1D1E),
            ),
            titleMedium: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff0D1D1E),
            ),
            titleSmall: TextStyle(fontSize: 6, fontWeight: FontWeight.w400),
          ),
          scaffoldBackgroundColor: Color(0xffFFFFFF),
        ),
        home: PageView(
          children: [
            NewChat(),
            // Suggest(),
            // AboutUs(),
            // ProfilePage(),
            // HomeView(),
            // CreateNewPassword(),
            // OtpView(),
            // LoginView(),
            // ForgetPasswordView(),
            // RegisterView(),
            // SplashScreen(),
          ],
        ),
        navigatorKey: navKey,
      ),
    );
  }
}
