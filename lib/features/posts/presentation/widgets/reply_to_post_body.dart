import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';

class ReplyToPostBody extends StatefulWidget {
  const ReplyToPostBody(
      {super.key,
      required this.postId,
      required this.postPoster,
      required this.postbody});
  final String postId;
  final String postPoster;
  final String postbody;

  @override
  State<ReplyToPostBody> createState() => _ReplyToPostBodyState();
}

class _ReplyToPostBodyState extends State<ReplyToPostBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  Uint8List? _cvFile;

  Future<void> _getCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      final cvPath = result.files.first.path;
      if (cvPath != null) {
        setState(() async {
          _cvFile = await result.files.first.xFile.readAsBytes();
        });
      }
    } else {}
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _fullnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              borderColor: AppColors.blackColor,
              validator: (fullname) {
                if (fullname != null && fullname.isNotShortText()) {
                  return null;
                } else {
                  return TextStrings.nameValidation;
                }
              },
              controller: _fullnameController,
              prefixIconPath: IconsPath.user,
              labelText: "Name"),
          PaddingConfig.h16,
          CustomTextFormField(
              borderColor: AppColors.blackColor,
              validator: (email) {
                if (email != null && email.isValidEmail()) {
                  return null;
                } else {
                  return TextStrings.emailValidation;
                }
              },
              controller: _emailController,
              prefixIconPath: IconsPath.email,
              labelText: "Email"),
          PaddingConfig.h16,
          IntlPhoneField(
            initialCountryCode: 'SY',
            controller: _phoneController,
            decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.grayColor))),
          ),
          PaddingConfig.h16,
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.blackColor, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.document),
                    PaddingConfig.w24,
                    Text(
                      "CV",
                      style:
                          AppTextStyle.subtitle03(color: AppColors.blackColor),
                    ),
                  ],
                ),
                PaddingConfig.h16,
                InkWell(
                  onTap: () async {
                    _getCVFile();
                  },
                  child: const Icon(
                    Iconsax.direct_send,
                    color: AppColors.greenColor,
                  ),
                ),
                PaddingConfig.h8,
                Text(
                  _cvFile != null
                      ? _cvFile!.length.toString()
                      : "select or drop a file",
                  style: AppTextStyle.subtitle03(color: AppColors.greenColor),
                ),
              ],
            ),
          ),
          PaddingConfig.h40,
          BlocListener<PostBloc, PostState>(
            listener: (context, state) {
              if (state.sendReplyStatus == CasualStatus.loading) {
                CustomQuickAlert().loadingAlert(context);
              } else if (state.sendReplyStatus == CasualStatus.success) {
                context.pop();
                CustomQuickAlert().successAlert(context);
                context.pop();
              } else if (state.sendReplyStatus == CasualStatus.failure) {
                context.pop();
                CustomQuickAlert().failureAlert(context, state.message);
              }
            },
            listenWhen: (previous, current) =>
                previous.sendReplyStatus != current.sendReplyStatus,
            child: CustomCartoonButton(
              isHover: ValueNotifier(false),
              title: "Sent a reply",
              width: double.infinity,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (_cvFile == null) {
                    CustomQuickAlert().addCvAlert(context);
                  } else {
                    context.read<PostBloc>().add(ReplyToPostEvent(
                        fullName: _fullnameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        cv: _cvFile!,
                        postId: int.parse(widget.postId)));
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
