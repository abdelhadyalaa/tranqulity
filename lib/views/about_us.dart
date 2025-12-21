import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/views/home/view.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          goTo(page: HomeView(),canPop: false);
        }, icon: Icon(Icons.arrow_back)),
        title: Text(
          "About Us",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(image: "about_us.png", width: 238, height: 238),
              SizedBox(height: 24.h),

              Text(
                textAlign: TextAlign.center,
                "Welcome to Tranquilit \nwhere relaxation meets innovation.",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(height: 12.h),
              Text(
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                "Welcome to Tranquility – your personal assistant in the digital world. At Tranquility, we believe that everyone deserves a moment of peace and calm amidst the chaos of everyday life. Our mission is to provide a sanctuary where you can unwind, destress, and find solace through meaningful conversations with our AI chatbot.",
              ),
              SizedBox(height: 16.h),

              Text(
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                "In today's fast-paced world, it's easy to feel overwhelmed and anxious. That's why we've created Tranquility – to offer you a refuge where you can freely express yourself without fear of judgment or interruption. Whether you're seeking advice, a listening ear, or simply some company, our AI chatbot is here to support you every step of the way.",
              ),
              SizedBox(height: 16.h),

              Text(
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                "Our team is passionate about mental well-being and technology, and we're dedicated to harnessing the power of AI to promote relaxation and mindfulness. With Tranquility, you can embark on a journey of self-discovery, self-care, and self-improvement, all from the comfort of your smartphone.",
              ),
              SizedBox(height: 16.h),

              Text(
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                "So why wait? Take a deep breath, download Tranquility, and let our AI chatbot guide you on your path to inner peace and tranquility. Together, we can create a brighter, calmer future – one conversation at a time.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
