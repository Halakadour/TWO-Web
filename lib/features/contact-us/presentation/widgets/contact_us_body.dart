import 'package:auto_size_widget/auto_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';

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
                  labelText: "Subject",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: AppColors.fontDarkColor))),
            ),
          ),
          PaddingConfig.h20,
          SizedBox(
            width: 600,
            child: IntlPhoneField(
              controller: _phoneController,
              initialCountryCode: 'SY',
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: AppColors.fontDarkColor))),
            ),
          ),
          PaddingConfig.h10,
          AutoSizeWidget(
            initialWidth: 500,
            initialHeight: 100,
            maxWidth: 500,
            maxHeight: 250,
            boxDecoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.fontDarkColor),
                borderRadius: BorderRadius.circular(5)),
            showIcon: true,
            child: TextField(
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              maxLines: 3 * 120,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                hintText: "Message",
              ),
            ),
          ),
          PaddingConfig.h30,
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
              isHover: ValueNotifier(false),
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
