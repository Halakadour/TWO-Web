import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/centerd_view.dart';
import 'package:two_website/features/about-us/presentation/widgets/custom_linked_text.dart';
import 'package:two_website/features/services/presentation/widgets/service_card.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  final ScrollController _controller = ScrollController();

  void _scrollLeft() {
    _controller.animateTo(
      _controller.offset - 1000,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _controller.animateTo(
      _controller.offset + 1000,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CenterdView(
        color: AppColors.blackColor,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.services.tr().toUpperCase(),
                  style: AppTextStyle.heading00(color: AppColors.whiteColor),
                ),
              ],
            ),
            PaddingConfig.h40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "our experts team of programmers and software engineers will help to create your software as you\ndream, whether you order an application ar a website ypu would has a chanse to manage your busniss\nwith the power of software tools. we have an offer to you!",
                  style: AppTextStyle.subtitle03(color: AppColors.whiteColor),
                ),
                CustomLinkedText(
                  title: LocaleKeys.seeAll.tr(),
                )
              ],
            ),
            PaddingConfig.h40,
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.whiteColor,
                    ),
                    onPressed: _scrollLeft,
                  ),
                  PaddingConfig.w30,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) => const ServiceCard(
                          imagePath: ImagesPath.web,
                          serviceTitlel: "Website\nDelevlopment"),
                    ),
                  ),
                  PaddingConfig.w30,
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.whiteColor,
                    ),
                    onPressed: _scrollRight,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
