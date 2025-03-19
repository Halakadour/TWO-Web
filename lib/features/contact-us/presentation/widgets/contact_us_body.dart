import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/contact-us/presentation/bloc/contact_us_bloc.dart';

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
                  labelText: "subject",
                  labelStyle:
                      AppTextStyle.subtitle02(color: AppColors.fontLightColor),
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
                  AppTextStyle.subtitle02(color: AppColors.fontLightColor),
              initialCountryCode: 'SY',
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.fieldColor,
                  labelText: "Phone Number",
                  labelStyle:
                      AppTextStyle.subtitle02(color: AppColors.fontLightColor),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizesConfig.borderRadiusMd),
                      borderSide: BorderSide.none)),
            ),
          ),
          PaddingConfig.h8,
          AutoSizeWidget(
            initialWidth: 500,
            initialHeight: 100,
            maxWidth: 500,
            maxHeight: 250,
            boxDecoration: BoxDecoration(
                color: AppColors.fieldColor,
                borderRadius:
                    BorderRadius.circular(SizesConfig.borderRadiusMd)),
            showIcon: true,
            child: TextField(
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              maxLines: 3 * 120,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                hintText: "Message",
                hintStyle:
                    AppTextStyle.subtitle02(color: AppColors.fontLightColor),
              ),
            ),
          ),
          const SizedBox(
            height: SizesConfig.spaceBtwItems,
          ),
          BlocListener<ContactUsBloc, ContactUsState>(
            listener: (context, state) {
              if (state.createContcatStatus == CasualStatus.loading) {
                CustomQuickAlert().loadingAlert(context);
              } else if (state.createContcatStatus == CasualStatus.success) {
                context.pop();
                CustomQuickAlert().successAlert(context);
              } else if (state.createContcatStatus == CasualStatus.failure) {
                context.pop();
                CustomQuickAlert().failureAlert(context, state.message);
              } else if (state.createContcatStatus == CasualStatus.noToken) {
                context.pop();
                CustomQuickAlert().noTokenAlert(context);
              }
            },
            listenWhen: (previous, current) =>
                previous.createContcatStatus != current.createContcatStatus,
            child: CustomCartoonButton(
              title: "Send A Message",
              width: double.infinity,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<ContactUsBloc>().add(CreateContactUsEvent(
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
