import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

// ignore: must_be_immutable
class FetchCvBox extends StatefulWidget {
  FetchCvBox({super.key, required this.fileB64, required this.onUpdate});
  String? fileB64;
  final Function(String?) onUpdate;

  @override
  State<FetchCvBox> createState() => _FetchCvBoxState();
}

class _FetchCvBoxState extends State<FetchCvBox> {
  Future<void> _getCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      final bytes = await result.files.first.xFile.readAsBytes();
      widget.fileB64 = base64Encode(bytes);
      widget.onUpdate(widget.fileB64);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.fieldColor, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          InkWell(
              onTap: () async {
                _getCVFile();
              },
              child: const Icon(
                Iconsax.direct_inbox,
                size: SizesConfig.iconsMd,
                color: AppColors.greenShade2,
              )),
          PaddingConfig.h8,
          Text(
            widget.fileB64 != null ? "Cv Selected" : "select or drop a file",
            style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
          ),
        ],
      ),
    );
  }
}
