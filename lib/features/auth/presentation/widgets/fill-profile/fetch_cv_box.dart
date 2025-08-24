import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

// ignore: must_be_immutable
class FetchCvBox extends StatelessWidget {
  FetchCvBox(
      {super.key,
      required this.fileB64,
      required this.onUpdate,
      this.hasBorder = false});
  String? fileB64;
  final Function(String?) onUpdate;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String?> fileName = ValueNotifier(null);
    Future<void> getCVFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null && result.files.isNotEmpty) {
        final bytes = await result.files.first.xFile.readAsBytes();
        fileName.value = result.files.first.name;
        fileB64 = base64Encode(bytes);
        onUpdate(fileB64);
      }
    }

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: hasBorder ? Colors.transparent : AppColors.fieldColor,
        borderRadius: BorderRadius.circular(12),
        border: hasBorder ? Border.all(color: AppColors.black, width: 1) : null,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          InkWell(
              onTap: () async {
                getCVFile();
              },
              child: const Icon(
                Iconsax.cloud_plus,
                size: SizesConfig.iconsMd,
                color: AppColors.greenShade2,
              )),
          PaddingConfig.h8,
          ValueListenableBuilder(
            valueListenable: fileName,
            builder: (context, value, child) => Text(
              value ?? TextStrings.selectFile,
              style: AppTextStyle.bodySm(color: AppColors.greenShade2),
            ),
          ),
        ],
      ),
    );
  }
}
