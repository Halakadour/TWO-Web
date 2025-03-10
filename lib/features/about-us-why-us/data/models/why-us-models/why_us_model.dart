import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';

class WhyUsModel extends WhyUsEntity {
  final int id;
  final String whyUs;

  WhyUsModel({
    required this.id,
    required this.whyUs,
  }) : super(whyUsId: id, whyUsDoc: whyUs);

  factory WhyUsModel.fromJson(Map<String, dynamic> json) => WhyUsModel(
        id: json["id"],
        whyUs: json["why_us"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "why_us": whyUs,
      };
}
