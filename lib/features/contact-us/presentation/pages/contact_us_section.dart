import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class ContactUsSection extends StatefulWidget {
  const ContactUsSection({super.key});

  @override
  State<ContactUsSection> createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> {
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.contactUs.tr().toUpperCase(),
              style: AppTextStyle.heading00(),
            ),
          ],
        ),
        PaddingConfig.h60,
        Row(
          children: [
            SizedBox(
              width: 500,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Subject*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: AppColors.fontDarkColor))),
              ),
            ),
            PaddingConfig.w20,
            SizedBox(
              width: 500,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Phone*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: AppColors.fontDarkColor))),
              ),
            ),
          ],
        ),
        PaddingConfig.h10,
        SizedBox(
          width: 1020,
          child: TextFormField(
            maxLines: 7,
            decoration: InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: AppColors.fontDarkColor))),
          ),
        ),
        PaddingConfig.h20,
        CustomCartoonButton(
          title: "Send A Message",
          isHover: isHover,
          onTap: () async {
            if (await SharedPreferencesServices.getUserToken() == null) {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: "You need to sign in");
            } else {}
          },
        )
      ],
    ));
  }
}
