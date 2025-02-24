import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';

class CreatePostForm extends StatefulWidget {
  const CreatePostForm({super.key});

  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  late TextEditingController _postNameController;
  Uint8List? imageBytes;

  Future<void> _getImageFile() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) async {
        if (value != null) {
          imageBytes = await value.readAsBytes();
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    _postNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          filled: true,
          fillColor: AppColors.fieldColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(SizesConfig.cardRadiusMd)),
          prefixIconWidget: const Icon(Iconsax.direct_right),
          labelText: 'Post Title',
          controller: _postNameController,
          validator: (p0) {
            if (p0 != null) {
              return null;
            } else {
              return "Please Add Title";
            }
          },
        ),
        PaddingConfig.h20,
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: AppColors.fieldColor,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: imageBytes == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _getImageFile();
                      },
                      child: SvgPicture.asset(
                        IconsPath.upload,
                        width: 20,
                        // ignore: deprecated_member_use
                        color: AppColors.greenColor,
                      ),
                    ),
                    Text(
                      "select or drop an image",
                      style:
                          AppTextStyle.subtitle03(color: AppColors.greenColor),
                    ),
                  ],
                )
              : CustomRoundedImage(
                  imageType: ImageType.memory,
                  memoryImage: imageBytes,
                  borderRadius: 10,
                ),
        ),
        PaddingConfig.h40,
        SizedBox(
          width: double.infinity,
          child: CustomCartoonButton(
            title: "Create",
            isHover: ValueNotifier(false),
            onTap: () {
              if (imageBytes == null) {
                CustomQuickAlert().addImageAlert(context);
              } else {
                context.read<PostBloc>().add(CreatePostEvent(
                    image: imageBytes!, body: _postNameController.text));
              }
            },
          ),
        ),
        PaddingConfig.h20,
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Cancel",
              style: AppTextStyle.buttonStyle(),
            ))
      ],
    );
  }
}
