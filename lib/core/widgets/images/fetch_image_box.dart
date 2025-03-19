import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';

// ignore: must_be_immutable
class FetchImageBox extends StatefulWidget {
  FetchImageBox({super.key, required this.imageB64, required this.onUpdate});
  String? imageB64;
  final Function(String?) onUpdate;

  @override
  State<FetchImageBox> createState() => _FetchImageBoxState();
}

class _FetchImageBoxState extends State<FetchImageBox> {
  Uint8List? imageBytes;

  Future<void> _getImageFile() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      imageBytes = bytes;
      widget.imageB64 = base64Encode(bytes);
      print(widget.imageB64);
      widget.onUpdate(widget.imageB64);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray, width: .7),
              borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd)),
          padding: const EdgeInsets.all(8.0),
          child: imageBytes == null
              ? const Icon(
                  Iconsax.gallery,
                  size: SizesConfig.iconsXl,
                )
              : CustomRoundedImage(
                  imageType: ImageType.memory,
                  memoryImage: imageBytes,
                  borderRadius: 10,
                ),
        ),
        PaddingConfig.h8,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => _getImageFile(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizesConfig.borderRadiusSm),
                    border: Border.all(color: AppColors.gray, width: .7)),
                child: Text(
                  "Upload Image",
                  style: AppTextStyle.subtitle03(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
