import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';

// ignore: must_be_immutable
class FetchImageCircle extends StatefulWidget {
  FetchImageCircle({super.key, required this.imageB64, required this.onUpdate});
  String? imageB64;
  final Function(String?) onUpdate;

  @override
  State<FetchImageCircle> createState() => _FetchImageCircleState();
}

class _FetchImageCircleState extends State<FetchImageCircle> {
  ValueNotifier<Uint8List?> imageBytes = ValueNotifier(null);
  Future<void> _getImageFile() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        final bytes = await value.readAsBytes();
        imageBytes.value = bytes;
        widget.imageB64 = base64Encode(bytes);
        print(widget.imageB64);
        widget.onUpdate(widget.imageB64);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ValueListenableBuilder(
          valueListenable: imageBytes,
          builder: (context, image, child) => Container(
            width: 130,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.fieldColor,
            ),
            child: image == null
                ? const Icon(Iconsax.image, size: SizesConfig.iconsMd)
                : CustomRoundedImage(
                    padding: 0,
                    shape: BoxShape.circle,
                    imageType: ImageType.memory,
                    memoryImage: image,
                    applyImageradius: false,
                  ),
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.greenShade3,
            padding: const EdgeInsets.all(10),
            shape: const CircleBorder(),
          ),
          onPressed: () {
            _getImageFile();
          },
          icon: const Icon(Iconsax.camera, color: AppColors.white),
        ),
      ],
    );
  }
}
