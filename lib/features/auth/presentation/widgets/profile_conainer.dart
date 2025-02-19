import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/theme/color.dart';

// ignore: must_be_immutable
class ProfileConainer extends StatefulWidget {
  ProfileConainer({super.key, this.imageFile});
  File? imageFile;

  @override
  State<ProfileConainer> createState() => _ProfileConainerState();
}

class _ProfileConainerState extends State<ProfileConainer> {
  Future<void> _getImageFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      final imagePath = result.files.first.path;
      if (imagePath != null) {
        setState(() {
          widget.imageFile = File(imagePath);
        });
      }
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 130,
          height: 130,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.fieldColor),
          child: widget.imageFile != null
              ? Image.network(
                  widget.imageFile!.path,
                  fit: BoxFit.cover,
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    IconsPath.image,
                    color: AppColors.fontLightColor,
                  ),
                ),
        ),
        InkWell(
          onTap: () async {
            _getImageFile();
          },
          child: SvgPicture.asset(
            IconsPath.editPen,
            width: 40,
          ),
        )
      ],
    );
  }
}
