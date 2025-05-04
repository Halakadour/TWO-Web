import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/images/fetch_network_image.dart';
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
      width: MediaQuery.of(context).size.width * .25,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.fieldColor,
      )),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FetchNetworkImage(
            imagePath: serviceEntity.imageE,
            height: MediaQuery.of(context).size.width * .2,
            weight: double.maxFinite,
          ),
          PaddingConfig.h8,
          Text(
            serviceEntity.titleE,
            style: AppTextStyle.subtitle01(color: AppColors.white),
          ),
          PaddingConfig.h8,
          Text(
            serviceEntity.descriptionE,
            style: AppTextStyle.subtitle03(color: AppColors.white),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
