import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';

class WhyUsModel extends WhyUsEntity {
  final String whyUs;

  WhyUsModel({
    required this.whyUs,
  }) : super(whyUsDoc: whyUs);

  factory WhyUsModel.fromJson(Map<String, dynamic> json) => WhyUsModel(
        whyUs: json["why_us"],
      );

  Map<String, dynamic> toJson() => {
        "why_us": whyUs,
      };
}
