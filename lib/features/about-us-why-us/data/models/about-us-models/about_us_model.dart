import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';

class AboutUsModel extends AboutUsEntity {
  final String workTime;
  final String site;

  AboutUsModel({
    required this.workTime,
    required this.site,
  }) : super(aboutUsId: 0, workTime: workTime, site: site);

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        workTime: json["work_time"],
        site: json["site"],
      );

  Map<String, dynamic> toJson() => {
        "work_time": workTime,
        "site": site,
      };
}
