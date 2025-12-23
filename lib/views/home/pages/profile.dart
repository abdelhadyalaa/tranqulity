import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/core/ui/app_upload_image.dart';
import 'package:tranqulity/views/auth/change_pasword.dart';

import '../view.dart';

class ProfilePage extends StatefulWidget {
  final String label;

  const ProfilePage({super.key,  this.label="Gender"});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var formKey = GlobalKey<FormState>();
  String? selectedGender; // القيمة المختارة

  final List<Map<String, dynamic>> genders = [
    {"name": "Male", "icon": Icons.male, "color": Colors.blue},
    {"name": "Female", "icon": Icons.female, "color": Colors.pink},
    {"name": "Other", "icon": Icons.transgender, "color": Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,

          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                AppImageUpLoader(),
                SizedBox(height: 34.h),
                AppInput(label: "Name", keyboardType: TextInputType.name),
                AppInput(
                  label: "Phone Number",
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 185.w,
                        child: AppInput(
                          label: "Age",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SizedBox(
                          width: 185.w,
                          height: 65.h,

                          child: DropdownButtonFormField<String>(
                            initialValue: selectedGender,
                            decoration: InputDecoration(
                              labelText: widget.label,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                            ),
                            dropdownColor: Colors.grey.shade200,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a gender";
                              }
                              return null;
                            },
                            items: genders.map((gender) {
                              return DropdownMenuItem<String>(
                                value: gender["name"],
                                child: Row(
                                  children: [
                                    Icon(
                                      gender["icon"],
                                      color: gender["color"],
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      gender["name"],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 34.h),
                AppButton(
                  text: "Save",
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Every Thing Saved Successfully"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Future.delayed(Duration(seconds: 3), () {
                        goTo(page: HomeView());
                      });
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
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        goTo(page: ChangePassword());
                      },
                      child: AppImage(image: "edit.svg", color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
