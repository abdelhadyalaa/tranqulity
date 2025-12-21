import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tranqulity/core/ui/app_image.dart';

class ImagePickerIcon extends StatelessWidget {
  final Function(XFile file) onImagePicked;
  final String icon; // أيقونة مخصصة


  const ImagePickerIcon({super.key, required this.onImagePicked, required this.icon});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);


    if (image != null) {
      onImagePicked(image);
      Navigator.pop(context);
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _pickerItem(
                imagePath: "camera.svg",
                label: 'Camera',
                onTap: () => _pickImage(context, ImageSource.camera),
              ),
              _pickerItem(
                imagePath: 'gallery.svg',
                label: 'Gallery',
                onTap: () => _pickImage(context, ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _pickerItem({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(image: imagePath, width: 60),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isFirst = true;

    return GestureDetector(
      onTap: () => _showPicker(context),
      child: AppImage(image:icon,),
    );
  }
}
