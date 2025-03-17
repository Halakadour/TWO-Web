import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
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
    return PageTemplate(
      child: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state.createPostStatus == CasualStatus.loading) {
            CustomQuickAlert().loadingAlert(context);
          } else if (state.createPostStatus == CasualStatus.success) {
            context.pop();
            CustomQuickAlert().successAlert(context);
            context.read<PostBloc>().add(GetActivePostsEvent());
            context.pop();
          } else if (state.createPostStatus == CasualStatus.failure) {
            context.pop();
            CustomQuickAlert().failureAlert(context, state.message);
          } else if (state.createPostStatus == CasualStatus.noToken) {
            context.pop();
            CustomQuickAlert().noTokenAlert(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.createPostStatus != current.createPostStatus,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Breadcrumbs(
                paths: [
                  AppRouteConfig.dashboard,
                  AppRouteConfig.post,
                  AppRouteConfig.createPost
                ],
                pages: ["Dashboard", "Posts", "Create Post"],
              ),
              PaddingConfig.h16,
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  PaddingConfig.w8,
                  Text(
                    "Create Post",
                    style: AppTextStyle.heading04(),
                  )
                ],
              ),
              PaddingConfig.h24,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(SizesConfig.md),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(SizesConfig.borderRadiusMd)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.gray, width: .7),
                          borderRadius:
                              BorderRadius.circular(SizesConfig.cardRadiusMd)),
                      prefixIconWidget: const Icon(Iconsax.direct_right),
                      labelText: 'Post Title',
                      controller: _postNameController,
                      validator: (p0) {
                        if (p0 != null) {
                          return null;
                        } else {
                          return TextStrings.fieldValidation;
                        }
                      },
                    ),
                    PaddingConfig.h16,
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.gray, width: .7),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
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
                                    color: AppColors.greenShade2,
                                  ),
                                ),
                                Text(
                                  "select or drop an image",
                                  style: AppTextStyle.subtitle03(
                                      color: AppColors.greenShade2),
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
                  ],
                ),
              ),
              PaddingConfig.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Cancel",
                        style: AppTextStyle.buttonStyle(),
                      )),
                  PaddingConfig.w16,
                  CustomCartoonButton(
                    title: "Create",
                    onTap: () {
                      if (imageBytes == null) {
                        CustomQuickAlert().addImageAlert(context);
                      } else {
                        context.read<PostBloc>().add(CreatePostEvent(
                            image: imageBytes!,
                            body: _postNameController.text));
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
