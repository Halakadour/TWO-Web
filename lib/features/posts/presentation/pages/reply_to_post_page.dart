import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/templates/page_Template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';

class ReplyToPostPage extends StatefulWidget {
  const ReplyToPostPage(
      {super.key,
      required this.postId,
      required this.postPoster,
      required this.postbody});
  final String postId;
  final String postPoster;
  final String postbody;

  @override
  State<ReplyToPostPage> createState() => _ReplyToPostPageState();
}

class _ReplyToPostPageState extends State<ReplyToPostPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  File? _cvFile;
  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  Future<void> _getCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      final cvPath = result.files.first.path;
      if (cvPath != null) {
        setState(() {
          _cvFile = File(cvPath);
        });
      }
    } else {
      print("No file selected");
    }
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
    return Scaffold(
      body: PageTemplate(
          child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: PaddingConfig.containerPadding,
                decoration: const BoxDecoration(
                    color: AppColors.fieldColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Image.network("$imageUri${widget.postPoster}"),
                    PaddingConfig.h20,
                    Text(
                      widget.postbody,
                      style: AppTextStyle.subtitle02(),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: BlocListener<PostBloc, PostState>(
                  listener: (context, state) async {
                    if (state.sendReplyStatus == CasualStatus.loading) {
                      CustomQuickAlert().loadingAlert(context);
                    } else if (state.sendReplyStatus == CasualStatus.success) {
                      context.pop();
                      CustomQuickAlert().successAlert(context);
                    } else if (state.sendReplyStatus == CasualStatus.failure) {
                      context.pop();
                      //CustomQuickAlert().failureAlert(context);
                    } else {
                      const SizedBox();
                    }
                  },
                  listenWhen: (previous, current) =>
                      previous.sendReplyStatus != current.sendReplyStatus,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "sent a reply".toUpperCase(),
                              style: AppTextStyle.heading00(),
                            ),
                            PaddingConfig.h30,
                            CustomTextFormField(
                                validator: (fullname) {
                                  if (fullname != null &&
                                      fullname.isNotShortText()) {
                                    return null;
                                  } else {
                                    return "error";
                                  }
                                },
                                controller: _fullnameController,
                                prefixIconPath: IconsPath.user,
                                labelText: "full name*"),
                            PaddingConfig.h20,
                            CustomTextFormField(
                                validator: (email) {
                                  if (email != null && email.isValidEmail()) {
                                    return null;
                                  } else {
                                    return "error";
                                  }
                                },
                                controller: _emailController,
                                prefixIconPath: IconsPath.email,
                                labelText: "email*"),
                            PaddingConfig.h20,
                            CustomTextFormField(
                                validator: (email) {
                                  if (email != null && email.isValidPhone()) {
                                    return null;
                                  } else {
                                    return "error";
                                  }
                                },
                                controller: _phoneController,
                                prefixIconPath: IconsPath.email,
                                labelText: "phone Number*"),
                            PaddingConfig.h20,
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: AppColors.fieldColor,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconsPath.decument,
                                        width: 20,
                                      ),
                                      PaddingConfig.w20,
                                      Text(
                                        "CV",
                                        style: AppTextStyle.subtitle03(
                                            color: AppColors.fontDarkColor),
                                      ),
                                    ],
                                  ),
                                  PaddingConfig.h20,
                                  InkWell(
                                    onTap: () async {
                                      _getCVFile();
                                    },
                                    child: SvgPicture.asset(
                                      IconsPath.upload,
                                      width: 20,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                  Text(
                                    _cvFile != null
                                        ? _cvFile!.path
                                        : "select or drop a file",
                                    style: AppTextStyle.subtitle03(
                                        color: AppColors.greenColor),
                                  ),
                                ],
                              ),
                            ),
                            PaddingConfig.h40,
                            CustomCartoonButton(
                              isHover: _isHover,
                              title: "Sign Up",
                              width: double.infinity,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_cvFile == null) {
                                    CustomQuickAlert().addCvAlert(context);
                                  } else {
                                    context.read<PostBloc>().add(
                                        ReplyToPostEvent(
                                            fullName: _fullnameController.text,
                                            email: _emailController.text,
                                            phone: _phoneController.text,
                                            cv: _cvFile!,
                                            postId: int.parse(widget.postId)));
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
