import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/landing_state_handling.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/core/widgets/textfield/custom_text_form_field.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _subjectController;
  late final TextEditingController _phoneController;
  late final TextEditingController _messageController;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _subjectController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: 600,
            child: TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(
                  labelText: TextStrings.subject,
                  labelStyle:
                      AppTextStyle.bodyMd(color: AppColors.fontLightColor),
                  filled: true,
                  fillColor: AppColors.fieldColor,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizesConfig.borderRadiusMd),
                      borderSide: BorderSide.none)),
            ),
          ),
          PaddingConfig.h16,
          SizedBox(
            width: 600,
            child: IntlPhoneField(
              controller: _phoneController,
              dropdownTextStyle:
                  AppTextStyle.bodyMd(color: AppColors.fontLightColor),
              initialCountryCode: 'SY',
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.fieldColor,
                  labelText: TextStrings.phoneNumber,
                  labelStyle:
                      AppTextStyle.bodyMd(color: AppColors.fontLightColor),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizesConfig.borderRadiusMd),
                      borderSide: BorderSide.none)),
            ),
          ),
          PaddingConfig.h8,
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.fieldColor,
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(SizesConfig.borderRadiusMd)),
            maxLines: 5,
            labelText: TextStrings.message,
            controller: _messageController,
            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(
            height: SizesConfig.spaceBtwItems,
          ),
          BlocListener<LandingBloc, LandingState>(
            listener: (context, state) {
              LandingStateHandling().contactUsListener(state, context);
            },
            listenWhen: (previous, current) =>
                previous.createContcatStatus != current.createContcatStatus,
            child: CustomCartoonButton(
              title: TextStrings.sentMessage,
              width: double.infinity,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LandingBloc>().add(CreateContactUsEvent(
                      subject: _subjectController.text,
                      description: _messageController.text,
                      phone: _phoneController.text));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
