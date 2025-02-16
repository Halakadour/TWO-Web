import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class ContactUsSection extends StatefulWidget {
  const ContactUsSection({super.key});

  @override
  State<ContactUsSection> createState() => _ContactUsSectionState();
}

class _ContactUsSectionState extends State<ContactUsSection> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return CenterdView(
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
        h60,
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
            w20,
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
        h10,
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
        h20,
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: CustomCartoonButton(
            isHovered: _isHovered,
            title: "Send A Message",
          ),
        )
      ],
    ));
  }
}
