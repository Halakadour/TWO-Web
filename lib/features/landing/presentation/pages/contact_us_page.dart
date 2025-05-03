import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/widgets/contact-us/contact_us_body.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        color: AppColors.bgColor,
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
            PaddingConfig.h40,
            const ScrollTemplate(child: ContactUsBody())
          ],
        ));
  }
}
