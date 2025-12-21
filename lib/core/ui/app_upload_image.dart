import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';
import 'app_picker.dart';
import 'package:image_picker/image_picker.dart';

class AppImageUpLoader extends StatefulWidget {
  final String? image;

  const AppImageUpLoader({super.key, this.image});

  @override
  State<AppImageUpLoader> createState() => _AppImageUpLoaderState();
}

class _AppImageUpLoaderState extends State<AppImageUpLoader> {
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xff284243).withOpacity(0.15),
          radius: 75.r,
          child: _pickedImage == null
              ? Center(child: AppImage(image: widget.image ?? "gallery.svg"))
              : ClipRRect(
                  borderRadius: BorderRadius.circular(75.r),
                  child: Image.file(
                    File(_pickedImage!.path),
                    fit: BoxFit.cover,
                    width: 150.r,
                    height: 150.r,
                  ),
                ),
        ),

        Positioned(
          bottom: 1,
          right: 1,
          child: CircleAvatar(
            backgroundColor: const Color(0xff284243),
            child: ImagePickerIcon(
              icon: _pickedImage == null ? "plus.svg" : "edit.svg",
              onImagePicked: (XFile file) {
                setState(() {
                  _pickedImage = file;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
