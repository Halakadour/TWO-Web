import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/functions/bloc-state-handling/landing_state_handling.dart';
import 'package:two_website/core/widgets/textfield/custom_text_form_field.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fetch_cv_box.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

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
  String? _cvFile;
  void updateCVFile(String? base64) {
    setState(() {
      _cvFile = base64;
    });
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
              borderColor: AppColors.black,
              validator: (fullname) {
                if (fullname != null && fullname.isNotShortText()) {
                  return null;
                } else {
                  return TextStrings.fieldValidation;
                }
              },
              controller: _fullnameController,
              prefixIconPath: IconsPath.user,
              labelText: TextStrings.fullName),
          PaddingConfig.h16,
          CustomTextFormField(
              borderColor: AppColors.black,
              validator: (email) {
                if (email != null && email.isValidEmail()) {
                  return null;
                } else {
                  return TextStrings.emailValidation;
                }
              },
              controller: _emailController,
              prefixIconPath: IconsPath.email,
              labelText: TextStrings.email),
          PaddingConfig.h16,
          IntlPhoneField(
            initialCountryCode: 'SY',
            controller: _phoneController,
            decoration: InputDecoration(
                labelText: TextStrings.phoneNumber,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.gray))),
          ),
          PaddingConfig.h16,
          FetchCvBox(fileB64: _cvFile, onUpdate: updateCVFile),
          PaddingConfig.h40,
          BlocListener<LandingBloc, LandingState>(
            listener: (context, state) {
              LandingStateHandling().sendReplyListener(state, context);
            },
            listenWhen: (previous, current) =>
                previous.sendReplyStatus != current.sendReplyStatus,
            child: CustomCartoonButton(
              title: TextStrings.sentReply,
              width: double.infinity,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (_cvFile == null) {
                    ScaffoldMessenger(
                        child: SnackBar(content: Text(TextStrings.addCV)));
                  } else {
                    context.read<LandingBloc>().add(ReplyToPostEvent(
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
