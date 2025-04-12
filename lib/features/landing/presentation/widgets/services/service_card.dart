import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/images/memory_image_fetch.dart';
import 'package:two_website/features/landing/domain/entities/service_entity.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.serviceEntity,
  });
  final ServiceEntity serviceEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.fieldColor,
      )),
      child: Column(
        children: [
          FetchNetworkImage(imagePath: serviceEntity.imageE),
          PaddingConfig.h8,
          Text(
            serviceEntity.titleE,
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle02(color: AppColors.white),
          ),
          PaddingConfig.h8,
          Text(
            serviceEntity.descriptionE,
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle03(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
