import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/views/splash.dart';
import 'core/logic/helper_methods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        builder: (context, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: child,
          );
        },
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
        home: SplashScreen(),

        navigatorKey: navKey,
      ),
    );
  }
}
