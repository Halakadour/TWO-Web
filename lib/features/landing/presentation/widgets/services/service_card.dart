import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';
import 'package:two_website/features/landing/domain/entities/service_entity.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/custom_linked_text.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.serviceEntity,
  });
  final ServiceEntity serviceEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.fieldColor,
      )),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: CustomRoundedImage(
              imageType: ImageType.asset,
              image: serviceEntity.imageE,
              borderRadius: 0,
              width: double.infinity,
            ),
          ),
          PaddingConfig.h16,
          Text(
            serviceEntity.titleE,
            style: AppTextStyle.headerSm(color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          PaddingConfig.h8,
          Text(
            serviceEntity.descriptionE,
            style: AppTextStyle.bodySm(color: AppColors.white),
            overflow: TextOverflow.fade,
          ),
          PaddingConfig.h16,
          CustomLinkedText(title: TextStrings.exploreMore),
          PaddingConfig.h16,
        ],
      ),
    );
  }
}
