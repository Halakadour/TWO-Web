import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/core/network/enums.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage(
      {super.key,
      this.image,
      this.file,
      this.border,
      this.width = 56,
      this.height = 56,
      this.memoryImage,
      this.overlayColor,
      required this.imageType,
      this.backgroundColor,
      this.padding = SizesConfig.sm,
      this.margin,
      this.fit = BoxFit.cover,
      this.shape = BoxShape.rectangle,
      this.applyImageradius = true,
      this.borderRadius = SizesConfig.md});
  final bool applyImageradius;
  final BoxShape shape;
  final BoxBorder? border;
  final double borderRadius;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        shape: shape,
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }
    return ClipRRect(
      borderRadius: applyImageradius
          ? BorderRadius.circular(borderRadius)
          : BorderRadius.zero,
      child: imageWidget,
    );
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        fit: fit,
        color: overlayColor,
        imageUrl: "$imageUri$image",
        errorWidget: (context, url, error) => const Icon(Icons.error),
        //progressIndicatorBuilder: (context, url, progress) => ,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image(
        fit: fit,
        image: FileImage(file!),
        color: overlayColor,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image(
        fit: fit,
        image: AssetImage(image!),
        color: overlayColor,
      );
    } else {
      return const SizedBox();
    }
  }
}
