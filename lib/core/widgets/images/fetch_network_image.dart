import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/config/constants/sizes_config.dart';

class FetchNetworkImage extends StatefulWidget {
  const FetchNetworkImage(
      {super.key,
      required this.imagePath,
      this.shape = BoxShape.rectangle,
      this.height,
      this.weight});
  final String imagePath;
  final BoxShape shape;
  final double? height;
  final double? weight;

  @override
  State<FetchNetworkImage> createState() => _FetchNetworkImageState();
}

class _FetchNetworkImageState extends State<FetchNetworkImage> {
  Uint8List? imageBytes;

  Future<void> fetchImage(String filename) async {
    final response =
        await http.post(Uri.parse('$baseUri/api/get/image?filename=$filename'));

    if (response.statusCode == 200 && mounted) {
      setState(() {
        imageBytes = response.bodyBytes;
      });
    }
  }

  @override
  void initState() {
    fetchImage(widget.imagePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return imageBytes != null
        ? Container(
            height: widget.height,
            width: widget.weight,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: widget.shape,
                borderRadius:
                    BorderRadius.circular(SizesConfig.borderRadiusMd)),
            child: Image.memory(
              imageBytes!,
              fit: BoxFit.cover,
            ))
        : Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: widget.height,
              width: widget.weight,
              color: Colors.white,
            ),
          );
  }
}
