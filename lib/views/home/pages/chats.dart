import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_image.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          isLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 40.h),
                  if (!isLoaded) _emptyTime() else _fullTime(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _emptyTime extends StatelessWidget {
  const _emptyTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(image: "empty_chat.png", width: 200.w, height: 200.h),
          SizedBox(height: 8.h),
          Text(
            "You don’t have any Chats yet.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class _fullTime extends StatelessWidget {
  const _fullTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: 40.h),
            _Item(title: "About Work", time: "24/12/2025"),
            _Item(title: "About My Family", time: "24/12/2025"),
            _Item(title: "My self", time: "24/12/2025"),
          ],
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title, time;

  const _Item({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.only(end: 12, bottom: 16),
            padding: EdgeInsets.all(18),
            width: double.infinity.w,
            height: 70.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
              color: Color(0x2842431A).withValues(alpha: .10),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                Spacer(),
                Text(
                  time,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: AppImage(image: "delete.svg", width: 40.w, height: 40.h),
        ),
      ],
    );
  }
}
